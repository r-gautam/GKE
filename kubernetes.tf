
resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region
  project  = var.project

  networking_mode = "VPC_NATIVE"
  network         = google_compute_network.main.self_link
  subnetwork      = google_compute_subnetwork.private.self_link

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ip-range"
    services_secondary_range_name = "services-ip-range"
  }

  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

resource "google_container_node_pool" "general" {
  name       = var.node_pool_name
  location   = var.region
  cluster    = google_container_cluster.gke.name
  project    = var.project
  node_count = 1

  autoscaling {
    max_node_count = 2
    min_node_count = 1
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    labels = {
      role = "general"
      preemptible  = true
      disk_size_gb = 10
    }
    machine_type = "g1-small"

    # service_account = google_service_account.k8s-staging.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
