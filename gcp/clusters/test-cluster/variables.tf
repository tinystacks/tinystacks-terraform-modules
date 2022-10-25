variable "cluster_name" {
  type = string
  default = "test-cluster"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "cluster_node_disk_size" {
  type  = number
  default = 10
}

variable "cluster_node_type" {
  type = number
  default = "e2-medium"
}

variable "cluster_node_pool_count" {
  type = number
  default = 2
}

variable "cluster_network" {
  type = string
  default = "default"
}

variable "enable_private_nodes" {
  type = bool
  default = true
}

variable "enable_private_endpoint" {
  type = bool
  default = true
}