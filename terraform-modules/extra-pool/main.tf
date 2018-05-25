data "google_container_cluster" "primary" {
  name   = "${var.extra_cluster_name}"
  zone   = "${var.extra_zone}"
}

resource "google_container_node_pool" "extra-pool" {
  name       = "${var.extra_name}"
  zone       = "${var.extra_zone}"
  cluster    = "${var.extra_cluster_name}"
  node_count = "${var.extra_node_count}"
  depends_on = ["data.google_container_cluster.primary"]

  node_config {
    image_type   = "${var.extra_image_type}"
    machine_type = "${var.extra_machine_type}"
    disk_size_gb = "${var.extra_disk_size_gb}"
  }

  timeouts {
    create = "60m"
    delete = "2h"
  }
}
