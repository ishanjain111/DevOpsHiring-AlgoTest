terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

module "doks_cluster" {
  source       = "./modules/cluster"
  cluster_name = var.cluster_name
  region       = var.region
  kubernetes_version = var.kubernetes_version
  node_count   = var.node_count
  node_size    = var.node_size
  tags         = var.tags
}

module "registry" {
  source       = "./modules/registry"
  registry_name = var.registry_name
}
