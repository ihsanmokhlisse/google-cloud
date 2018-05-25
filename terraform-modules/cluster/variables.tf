variable "name" {
  description = "The name of the cluster, unique within the project and zone"
  default     = "TESTING-ENVIRONMENT"
}

variable "description" {
  description = "Cluster description"
}

variable "zone" {
  description = "The zone the master and nodes specified in initial_node_count should be created in"
}

variable "disable_dashboard" {
  description = "Whether the Kubernetes Dashboard should be disabled"
  default     = false
}

variable "disable_autoscaling_addon" {
  description = "Whetherthe Autoscaling Pod addon should be disabled"
  default     = false
}

variable "initial_node_count" {
  description = "The number of nodes to create in this cluster (not including the Kubernetes master)"
  default     = 1
}

variable "network" {
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected"
  default     = "default"
}

variable "node_disk_size_gb" {
  description = "Size of the disk attached to each node, specified in GB"
  default     = 10
}

variable "node_machine_type" {
  description = "The cluster node"
  default     = "f1-micro"
}

variable "node_image_type" {
  description = "The image type"
  default     = "COS"                                                                                                                             # Container-Optimized OS
}
###################################EXTRA-NODE##################################### 
#variable "initial_extra_node_count" {
#  description = "The number of nodes to create in this cluster (not including the Kubernetes master)"
#  default     = 1
#}

#variable "extra_node_disk_size_gb" {
#  description = "Size of the disk attached to each node, specified in GB"
#  default     = 10
#}

#variable "extra_node_machine_type" {
#  description = "The cluster node"
#  default     = "f1-micro"
#}

#variable "extra_node_image_type" {
#  description = "The image type"
#  default     = "COS"                                                                                                                             # Container-Optimized OS

variable "depends_on" {
  default = []
  type = "list"
}


