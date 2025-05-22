terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}


resource "digitalocean_kubernetes_cluster" "this" {
  name   = var.cluster_name
  region = var.region
  version = var.kubernetes_version


  node_pool {
    name       = "default-pool"
    size       = var.node_size
    node_count = var.node_count
  }
  
  tags = var.tags
}
