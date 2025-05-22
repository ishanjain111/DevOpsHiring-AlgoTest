variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "region" {
  description = "Region to deploy the cluster in"
  type        = string
  default     = "blr1"
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 1
}

variable "node_size" {
  description = "Size of the nodes in the cluster"
  type        = string
  default     = "s-1vcpu-2gb"
}

variable "tags" {
  description = "Tags to associate with resources"
  type        = list(string)
  default     = ["dev"]
}

variable "registry_name" {
  description = "Name of the container registry"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
  type        = string
}
