terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_container_registry" "this" {
  name       = var.registry_name
  subscription_tier_slug = "starter"
  region     = "blr1"
}
