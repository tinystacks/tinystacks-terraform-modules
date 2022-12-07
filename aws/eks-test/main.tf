
module "eks" {
  source       = "../modules/eks"
  cluster_name = "test123"
  helm_release_name  = "test"
  helm_path    = "../modules/eks/helm/testchart"
  values = [{
    name  = "repoUri",
    value = "nginx"
    },
    {
      name  = "imageTag",
      value = "latest"
    },
    {
      name  = "containerPort",
      value = 80
    },
    {
      name  = "portProtocol",
      value = "TCP"
    },
    {
      name  = "appName",
      value = "test"
    },
    {
      name = "deploymentReplicas"
      value = 3
    }
  ]
  AWS_REGION         = "us-east-1"
  max_node_count     = 6
  desired_node_count = 4
  min_node_count     = 4
  env_variables      = { "env" : { "DB_HOST" : "postgresql://example:example@postgres.com:1234", "test2" : "test" } }
}