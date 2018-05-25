# create network to run cluster instances
module "rex_network" {
  source = "../terraform-modules/vpc"
  name   = "${var.ntw_name}"
}

# create cluster
module "rex-testing" {
  source             = "../terraform-modules/cluster"
  name               = "${var.name}"
  description        = "${var.description}"
  zone               = "${var.zone}"
#  initial_node_count = "${var.initial_node_count}"
#  initial_extra_node_count = "${var.initial_extra_node_count}"
  network            = "${module.rex_network.name}"
#depends_on = ["google_container_cluster.primary"]
#depends_on = ["google_container_node_pool.extra-pool"]
#depends_on = ["google_container_node_pool.np"]
}

# create main node pool and attach it to my-cluster
module "main_node" {
  source       = "../terraform-modules/node-pool"
  name         = "main-pool"
  zone         = "${var.zone}"
  cluster_name = "${module.rex-testing.name}"
  node_count   = 3
#  depends_on = ["google_container_cluster.primary"]
  depends_on = ["module.rex-testing"]
}

#extra node
module "extra-node" {
  source       = "../terraform-modules/extra-pool"
  extra_name         = "extra-pool"
  extra_zone         = "${var.zone}"
  extra_cluster_name = "${module.rex-testing.name}"
  extra_node_count   = 1
# depends_on = ["google_container_cluster.primary"]
  depends_on = ["module.rex-testing", "module.main_node"]
}

module "mysql-db" {
  source           = "../terraform-modules/db"
  project          = "${var.project_id}"
  region           = "${var.region}"
  db_name          = "${var.db_name}"
  user_name        = "${var.db_user}"
  user_password    = "${var.db_passwd}"
}
