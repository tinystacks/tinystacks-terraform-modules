variable "cluster_name" {
  type = string
}

variable "desired_node_count" {
  type        = number
  description = "Desired number of worker nodes."
  default     = 2
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of worker nodes."
  default     = 2
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of worker nodes."
  default     = 1
}

variable "max_unavailable_nodes" {
  type        = number
  description = "Desired max number of unavailable worker nodes during node group update."
  default     = 1
}

variable "node_disk_size" {
  type        = number
  description = "Disk size in GiB for worker nodes."
  default     = 100
}

variable "instance_types" {
  type        = list(string)
  description = "List of instance types associated with the EKS Node Group."
  default     = ["t3.medium"]
}

variable "helm_release_name" {
  type        = string
  description = "The name of the helm release."
}

variable "helm_values_files" {
  type        = list(string)
  description = "A list of locations of the helm values files."
  default     = []
}

variable "helm_path" {
  type        = string
  description = "Path to helm chart."
}

variable "values" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "Values to be merged with the values yaml."
  default     = []
}

variable "env_variables" {
  type = object({
    env = object({})
  })
  description = "Environment variables for the containers."
}

variable "AWS_REGION" {
  type = string
}

variable "stack_name" {
  type        = string
  description = "The value specified in the alb.ingress.kubernetes.io/group.name annotation"
  default     = "stack"
}