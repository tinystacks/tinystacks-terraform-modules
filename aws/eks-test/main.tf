provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source = "../modules/eks"
  cluster_name = "test123"
  helm_release_name = "test"
  helm_repository = "s3://helm-charts-tinystacks/testchart"
  helm_chart_name = "testchart"
  max_node_count = 6
  desired_node_count = 4
  min_node_count = 4
}