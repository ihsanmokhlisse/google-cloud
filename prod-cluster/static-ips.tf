resource "google_compute_global_address" "rex-main_static_ip" {
  name = "rex-main-static-ip"
}

resource "google_compute_address" "rex_static_ip" {
  name = "rex-static-ip"
}
