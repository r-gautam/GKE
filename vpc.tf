# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                    = var.network_name
  project                 = var.project
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"

}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "private" {
  name                     = var.subnet_name
  project                  = var.project
  ip_cidr_range            = "10.5.0.0/20"
  region                   = var.region
  network                  = google_compute_network.main.self_link
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pod-ip-range"
    ip_cidr_range = "10.0.0.0/14"
  }

  secondary_ip_range {
    range_name    = "services-ip-range"
    ip_cidr_range = "10.4.0.0/19"
  }
}
