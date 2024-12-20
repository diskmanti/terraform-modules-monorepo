resource "kind_cluster" "cluster" {
  name           = var.cluster_name
  node_image     = var.node_image
  wait_for_ready = var.wait_for_ready


  kubeconfig_path = pathexpand(var.kubeconfig_path)

  kind_config {
    kind        = "Cluster"
    api_version = var.kind_api_version

    containerd_config_patches = var.containerd_config_patches

    node {
      role = "control-plane"

      kubeadm_config_patches = var.kubeadm_config_patches

      extra_port_mappings {
        container_port = 80
        host_port      = 80
      }
      extra_port_mappings {
        container_port = 443
        host_port      = 443
      }
    }

    dynamic "node" {
      for_each = range(var.worker_node_count)
      content {
        role                   = "worker"
        image                  = var.node_image
        kubeadm_config_patches = var.kubeadm_config_patches
      }

    }
    networking {
      disable_default_cni = var.disable_default_cni
      pod_subnet          = var.pod_subnet
      service_subnet      = var.service_subnet
    }
  }
}

resource "null_resource" "approve_csr" {
  triggers = {
    cluster_id = kind_cluster.cluster.id
  }

  provisioner "local-exec" {
    command = "export KUBECONFIG=${var.kubeconfig_path};for kubeletcsr in `kubectl -n kube-system get csr | grep kubernetes.io/kubelet-serving | awk '{ print $1 }'`; do kubectl certificate approve $kubeletcsr; done"
  }

  depends_on = [kind_cluster.cluster]
}

resource "null_resource" "install_gateway_api" {
  triggers = {
    cluster_id = kind_cluster.cluster.id
  }

  provisioner "local-exec" {
    command = "kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml"
  }

  depends_on = [kind_cluster.cluster]
}














