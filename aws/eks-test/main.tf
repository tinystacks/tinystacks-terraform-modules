
module "eks" {
  source       = "../modules/eks"
  cluster_name = "test123"
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
    }
  ]
  AWS_REGION         = "us-east-1"
  helm_release_name  = "test"
  max_node_count     = 6
  desired_node_count = 4
  min_node_count     = 4
  env_variables = {"env": {"test1": "test", "test2": "test"}}
}