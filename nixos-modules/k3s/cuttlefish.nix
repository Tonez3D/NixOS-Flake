{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.cuttlefish;
  inherit (cfg.details)
    nodes
    flags
    vip
    iface
    apiPort
    apiName
    podCIDR
    firewallTCPPorts
    firewallUDPPorts
    serviceCIDR
    extraSANs
    interfaces
    ;

  machine = nodes.${cfg.node} or (throw "\"${cfg.node}\" is not listed in cuttlefish.nodes");

  ciliumVersion = "1.19.3"; # https://github.com/cilium/cilium/releases
  kubeVipVersion = "v1.0.4"; # https://github.com/kube-vip/kube-vip/releases

  ciliumChart = {
    apiVersion = "helm.cattle.io/v1";
    kind = "HelmChart";
    metadata = {
      name = "cilium";
      namespace = "kube-system";
    };
    spec = {
      repo = "https://helm.cilium.io";
      chart = "cilium";
      version = ciliumVersion;
      targetNamespace = "kube-system";
      bootstrap = true;

      valuesContent = builtins.toJSON {
        kubeProxyReplacement = true;

        k8sServiceHost = "127.0.0.1";
        k8sServicePort = apiPort;
        ipam = {
          mode = "cluster-pool";
          operator.clusterPoolIPv4PodCIDRList = [ podCIDR ];
        };

        #cni = {
        #  binPath = "";
        #  confPath = "";
        #};
        operator.replicas = 2;
      };
    };
  };

  kubeVip = [
    {
      apiVersion = "v1";
      kind = "ServiceAccount";
      metadata = {
        name = "kube-vip";
        namespace = "kube-system";
      };
    }
    {
      apiVersion = "rbac.authorization.k8s.io/v1";
      kind = "ClusterRole";
      metadata.name = "system:kube-vip-role";
      rules = [
        {
          apiGroups = [ "" ];
          resources = [ "services/status" ];
          verbs = [ "update" ];
        }
        {
          apiGroups = [ "" ];
          resources = [
            "services"
            "endpoints"
          ];
          verbs = [
            "list"
            "get"
            "watch"
            "update"
          ];
        }
        {
          apiGroups = [ "" ];
          resources = [ "nodes" ];
          verbs = [
            "list"
            "get"
            "watch"
            "update"
            "patch"
          ];
        }
        {
          apiGroups = [ "" ];
          resources = [ "pods" ];
          verbs = [ "list" ];
        }
        {
          apiGroups = [ "coordination.k8s.io" ];
          resources = [ "leases" ];
          verbs = [
            "list"
            "get"
            "watch"
            "update"
            "create"
          ];
        }
        {
          apiGroups = [ "discovery.k8s.io" ];
          resources = [ "endpointslices" ];
          verbs = [
            "list"
            "get"
            "watch"
            "update"
          ];
        }
      ];
    }
    {
      apiVersion = "rbac.authorization.k8s.io/v1";
      kind = "ClusterRoleBinding";
      metadata.name = "system:kube-vip-binding";
      roleRef = {
        apiGroup = "rbac.authorization.k8s.io";
        kind = "ClusterRole";
        name = "system:kube-vip-role";
      };
      subjects = [
        {
          kind = "ServiceAccount";
          name = "kube-vip";
          namespace = "kube-system";
        }
      ];
    }
    {
      apiVersion = "apps/v1";
      kind = "DaemonSet";
      metadata = {
        name = "kube-vip-ds";
        namespace = "kube-system";
      };
      spec = {
        selector.matchLabels."app.kubernetes.io/name" = "kube-vip-ds";
        template = {
          metadata.labels."app.kubernetes.io/name" = "kube-vip-ds";
          spec = {
            affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms = [
              {
                matchExpressions = [
                  {
                    key = "node-role.kubernetes.io/control-plane";
                    operator = "Exists";
                  }
                ];
              }
            ];
            hostNetwork = true;
            serviceAccountName = "kube-vip";
            tolerations = [
              {
                effect = "NoSchedule";
                operator = "Exists";
              }
              {
                effect = "NoExecute";
                operator = "Exists";
              }
            ];
            containers = [
              {
                name = "kube-vip";
                image = "ghcr.io/kube-vip/kube-vip:${kubeVipVersion}";
                args = [ "manager" ];
                securityContext.capabilities.add = [
                  "NET_ADMIN"
                  "NET_RAW"
                ];
                env = lib.mapAttrsToList (name: value: { inherit name value; }) {
                  address = vip;
                  port = toString apiPort;
                  vip_interface = iface;
                  vip_cidr = "32";
                  vip_arp = "true";
                  cp_enable = "true";
                  cp_namespace = "kube-system";
                  svc_enable = "false";
                  vip_leaderelection = "true";
                  vip_leasename = "plndr-cp-lock";
                  vip_leaseduration = "5";
                  vip_renewdeadline = "3";
                  vip_retryperiod = "1";
                };
              }
            ];
          };
        };
      };
    }
  ];
in
{
  options.cuttlefish = {
    node = lib.mkOption {
      type = lib.types.enum (builtins.attrNames nodes);
      description = "Which cluster node this machine is.";
    };
    bootstrap = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Create a brand-new cluster from this node (k3s --cluster-init).
        kube1 only, for its first start only. Set back to false afterwards,
        or a wiped-and-rebuilt kube1 would start a second, separate cluster.
      '';
    };
    details = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Cluster details: nodes, VIP, pod/service CIDRs, etc.";
    };
    tokenFile = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Shared join token: same content on all nodes, mode 0600.";
    };
    agentTokenFile = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Shared agent join token: same content on all nodes, mode 0600.";
    };
    agentNode = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "This node is a k3s agent (worker) node, not a control-plane node.";
    };
  };

  config = {
    services.k3s = {
      enable = true;
      role = "server";
      clusterInit = cfg.bootstrap;
      serverAddr = lib.optionalString (!cfg.bootstrap) "https://${apiName}:${toString apiPort}";
      tokenFile = cfg.tokenFile;

      extraFlags = [
        "--node-ip=${machine.ip}"
        "--https-listen-port=${toString apiPort}"
        "--tls-san=${vip}"
        "--tls-san=${apiName}"
        "--cluster-cidr=${podCIDR}"
        "--service-cidr=${serviceCIDR}"
      ]
      ++ flags
      ++ map (s: "--tls-san=${s}") extraSANs;

      manifests = {
        cilium.content = ciliumChart;
        kube-vip.content = kubeVip;
      };
    };

    networking.hosts.${vip} = [ apiName ];

    networking.firewall = {
      allowedTCPPorts = [ apiPort ] ++ firewallTCPPorts;
      allowedUDPPorts = firewallUDPPorts;
      checkReversePath = "loose";
      trustedInterfaces = interfaces;
    };

    environment.systemPackages = [
      pkgs.cilium-cli
      pkgs.kubectl
    ];
  };
}
