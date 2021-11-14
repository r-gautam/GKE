# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  project = var.project
  network = google_compute_network.main.self_link
}
