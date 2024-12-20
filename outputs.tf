output "cluster_name" {
  value       = kind_cluster.cluster.name
  description = "Name of the created cluster"
}

output "kubeconfig_path" {
  value       = kind_cluster.cluster.kubeconfig_path
  description = "Path where kubeconfig is saved"
}

output "client_certificate" {
  value       = kind_cluster.cluster.client_certificate
  description = "Certificate of the created cluster"
}

output "client_key" {
  value       = kind_cluster.cluster.client_key
  description = "Certificate key of the created cluster"
}

output "cluster_ca_certificate" {
  value       = kind_cluster.cluster.cluster_ca_certificate
  description = "Certificate CA of the created cluster"
}

output "endpoint" {
  value       = kind_cluster.cluster.endpoint
  description = "Endpoint of teh cluster"
}

output "kubeconfig" {
  value       = kind_cluster.cluster.kubeconfig
  description = "Kubeconfig manifest"
}

output "id" {
  value       = kind_cluster.cluster.id
  description = "Clsuter ID"
}

output "kubectl_nodes" {
  value       = "You can use this command to get nodes: kubectl --kubeconfig=${kind_cluster.cluster.kubeconfig_path} get nodes -o wide"
  description = "Help message"
}

output "kubectl_pods" {
  value       = "You can use this command to get pods: kubectl --kubeconfig=${kind_cluster.cluster.kubeconfig_path} get pods -A"
  description = "Help message"
}
