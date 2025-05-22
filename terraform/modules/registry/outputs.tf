# modules/registry/outputs.tf
output "registry_url" {
  value = digitalocean_container_registry.this.endpoint
}