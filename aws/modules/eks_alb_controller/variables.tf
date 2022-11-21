variable "cluster_name" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}



variable "cluster_oidc_provider_url" {
  type = string
}

variable "region" {
  type = string
}

variable "values" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "Values to be merged with the values yaml"
  default = [
    {
      name: "serviceAccount.create",
      value: "false"
    }
  ]
}