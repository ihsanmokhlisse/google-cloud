provider "google" {
  version = "~> 1.12.0"
  project = "${var.project_id}"
  region  = "${var.region}"
}
