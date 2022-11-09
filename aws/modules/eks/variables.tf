variable "cluster_name" {
  type = string
}

variable "desired_node_count" {
  type = number
  description = "Desired number of worker nodes."
  default = 2
}

variable "max_node_count" {
  type = number
  description = "Maximum number of worker nodes."
  default = 2
}

variable "min_node_count" {
  type = number
  description = "Minimum number of worker nodes."
  default = 1
}

variable "max_unavailable_nodes" {
  type = number
  description = "Desired max number of unavailable worker nodes during node group update."
  default = 1
}

variable "node_disk_size" {
  type = number
  description = "Disk size in GiB for worker nodes."
  default = 100
}

variable "instance_types" {
  type = list(string)
  description = "List of instance types associated with the EKS Node Group."
  default = ["t3.medium"]
}