
module "eks" {
  source       = "../modules/eks"
  cluster_name = "test123"
  helm_path    = "../modules/eks/helm/testchart"
  values = [{
    name  = "repoUri",
    value = "759747741894.dkr.ecr.us-west-2.amazonaws.com/eks-pipeline-api-docker-flask-test"
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
  }]
  helm_release_name  = "test"
  max_node_count     = 6
  desired_node_count = 4
  min_node_count     = 4
}