output "rex-main_static_ip" {
  value = "${google_compute_global_address.rex-main_static_ip.address}"
}

output "rex_static_ip" {
  value = "${google_compute_address.rex_static_ip.address}"
}

output "kubconfig" {
  value = " ... \nRun command to configure access via kubectl:\n$ gcloud container clusters get-credentials ${module.rex-testing.name} --zone ${var.zone} --project ${var.project_id}"
}
