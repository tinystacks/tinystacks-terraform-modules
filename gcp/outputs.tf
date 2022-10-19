output "cluster_info" {
  value = {
    name: google_container_cluster.cluster.name
  }
}