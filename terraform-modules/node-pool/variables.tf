variable "name" {
  description = "node pool"
}

variable "zone" {
  description = "europe-west3-c"
}

variable "node_count" {
  description = "master-testing"
  default     = 1
}

variable "cluster_name" {
  description = "test-clust"
}

variable "machine_type" {
  description = "cluster mashine type"
  default     = "n1-standard-1"
}

variable "disk_size_gb" {
  description = "Disk size "
  default     = "40"
}

variable "image_type" {
  description = "The image type ###"
  default     = "COS"                                                                                                                             # Container-Optimized OS
}

variable "depends_on" {
  default = []
  type = "list"
}
