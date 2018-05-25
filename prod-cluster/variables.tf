## ---------------------
## Provider configuration
## ---------------------
variable "project_id" {
  description = "Project ID in GCP"
}

variable "region" {
  description = "Region in which to manage GCP resources"
}

## ---------------------
## Cluster configuration
## ---------------------
variable "name" {
  description = "The name of the cluster, unique within the project and zone"
}

variable "ntw_name" {
  description = "The name of the network to create to run cluster instances"
}

variable "description" {
  description = "Cluster description"
}

variable "zone" {
  description = "The zone the master and nodes specified in initial_node_count should be created in"
}

variable "initial_node_count" {
  description = "Number of nodes in the cluster"
  default     = 4
}

variable "initial_extra_node_count" {
  description = "Number of nodes in the cluster"
  default     = 1
}
##---------------------
##databse configuration
##---------------------

variable "db_name" {
  description = "database ame"
}

variable "db_user" {
  description = "database user"
}

variable "db_passwd" {
  description = "db_user password "
}

