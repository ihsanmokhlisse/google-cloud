variable "extra_name" {
  description = "extra node pool"
}

variable "extra_zone" {
  description = "europe-west3-c"
}

variable "extra_node_count" {
  description = "extra node testing "
  default     = 1
}

variable "extra_cluster_name" {
  description = "TESTING-ENVIRONMENT"
}

variable "extra_machine_type" {
  description = "cluster-node mashine type"
  default     = "n1-standard-2"
}

variable "extra_disk_size_gb" {
  description = "Disk size "
  default     = "40"
}

variable "extra_image_type" {
  description = "The image type ###"
  default     = "COS"                                                                                                                             # Container-Optimized OS
}

variable "depends_on" { 
  default = []
  type = "list"
}
