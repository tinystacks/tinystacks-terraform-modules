variable "cluster_name" {
  type = string
}

variable "cluster_node_pool_count" {
  type = number
  default = 2
}

variable "cluster_node_type" {
  type = string
  default = "e2-medium"
}

variable "cluster_node_disk_size" {
  type = number
  default = 10
}

variable "region" {
  type = string
  default = "us-central1"
}