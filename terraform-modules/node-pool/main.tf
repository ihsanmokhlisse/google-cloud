data "google_container_cluster" "primary" {
  name   = "${var.cluster_name}"
  zone   = "${var.zone}"
}

resource "google_container_node_pool" "np" {
  name       = "${var.name}"
  zone       = "${var.zone}"
  cluster    = "${var.cluster_name}"
  node_count = "${var.node_count}"
  depends_on = ["data.google_container_cluster.primary"]

  node_config {
    image_type   = "${var.image_type}"
    machine_type = "${var.machine_type}"
    disk_size_gb = "${var.disk_size_gb}"
  }

  timeouts {
    create = "60m"
    delete = "2h"
  }
}
