

module "cluster" {
  source = "../../modules/cluster"
  cluster_name = var.cluster_name
  region = var.region
  cluster_network = var.cluster_network
}

module "node_pool_1" {
  source = "../../modules/node_pools"
  cluster_name = var.cluster_name
  cluster_node_pool_count = var.cluster_node_pool_count
  cluster_node_type = var.cluster_node_type
  cluster_node_disk_size = var.cluster_node_disk_size
  region = var.region
}
