resource "google_service_account" "cluster_node_sa" {
  account_id   = "${var.cluster_name}-node-sa"
  display_name = "Service Account for the ${var.cluster_name} k8 cluster nodes."
}

resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  depends_on = [google_project_service.services]
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.cluster.name
  node_count = var.cluster_node_pool_count

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.cluster_node_sa.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}



