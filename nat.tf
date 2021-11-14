resource "google_compute_router_nat" "mist_nat" {
  name                               = var.nat_name
  project                            = var.project
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [google_compute_subnetwork.private]
}
