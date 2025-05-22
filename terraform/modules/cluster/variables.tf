variable "cluster_name" { type = string }
variable "region"       { type = string }
variable "node_count"   { type = number }
variable "node_size"    { type = string }
variable "tags"         { type = list(string) }
variable "kubernetes_version" { type = string }
