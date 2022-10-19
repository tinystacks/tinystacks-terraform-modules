variable "cluster_name" {
  type = string
  default = "test-cluster"
}

variable "cluster_node_pool_count" {
  type = number
  default = 2
}

variable "cluster_node_type" {
  type = string
  default = "e2-medium"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "services" {
  type = list(string)
  default = ["container.googleapis.com"]
}

