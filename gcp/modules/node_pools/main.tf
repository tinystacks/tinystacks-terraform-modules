resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.region
  cluster    = var.cluster_name
  node_count = var.cluster_node_pool_count

  node_config {
    preemptible  = true
    machine_type = var.cluster_node_type
    disk_size_gb = var.cluster_node_disk_size

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.cluster_node_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_service_account" "cluster_node_sa" {
  account_id   = "${var.cluster_name}-node-sa"
  display_name = "Service Account for the ${var.cluster_name} k8 cluster nodes."
}