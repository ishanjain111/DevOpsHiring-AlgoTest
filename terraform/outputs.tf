output "kubeconfig" {
  value     = module.doks_cluster.kubeconfig
  sensitive = true
}

output "registry_url" {
  value = module.registry.registry_url
}
