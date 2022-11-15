provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source = "../modules/eks"
  cluster_name = "test123"
  helm_release_name = "test"
  helm_repository = "s3://helm-charts-tinystacks/testchart"
  helm_chart_name = "testchart"
}