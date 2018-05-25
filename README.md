## Table of Contents
* [Terraform installation](#Terraform installation)
* [Repository structure](#repository-structure)
   * [terraform-modules](#terraform-modules)
   * [prod-cluster](#prod-cluster)


[Terraform](https://www.terraform.io/) is used to describe the desired state of the infrastructure, thus implementing Infrastructure as Code (IaC) approach.

[Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/) (GKE) service is used for cluster deployment. Since Google announced that [they had eliminated the cluster management fees for GKE](https://cloudplatform.googleblog.com/2017/11/Cutting-Cluster-Management-Fees-on-Google-Kubernetes-Engine.html), it became the safest and cheapest way to run a Kubernetes cluster on GCP, because you only pay for the nodes (compute instances) running in your cluster and Google abstracts away and takes care of the master control plane.  


## Terraform installation
To install Terraform, find the appropriate package(https://www.terraform.io/downloads.html) for your system and download it. Terraform is packaged as a zip archive.
After downloading Terraform, unzip the package. Terraform runs as a single binary named terraform. Any other files in the package can be safely removed and Terraform will still function.
The final step is to make sure that the terraform binary is available on the PATH.

export PATH=$PATH:/path/to/dir

Depending on what you're doing, you also may want to symlink to binaries:

cd /usr/bin
sudo ln -s /path/to/binary binary-name

Note that this will not automatically update your path for the remainder of the session. To do this, you should run:

source ~/.profile 
or
source ~/.bashrc



Check **terraform.tfvars** file inside `prod-cluster` folder to see what variables you need to define before you can use terraform to create a cluster.

```bash

Once the required variables are defined, use the commands below to create a Kubernetes cluster:
```bash
$ terraform init
$ terraform apply
```

After the cluster is created, run a command from terraform output to configure access to the cluster via `kubectl` command line tool. The command from terraform output will be in the form of:

```bash
$ gcloud container clusters get-credentials prod-cluster --zone europe-west3-b --project example-123456
```


## Repository structure
```bash
├── prod-cluster
└── terraform-modules
    ├── cluster
    ├── firewall
    │   └── ingress-allow
    ├── node-pool
    └── extra-pool
    ├── vpc
    └── db

```

### terraform-modules
The folder contains reusable pieces of terraform code which help us manage our configuration more efficiently by avoiding code repetition and reducing the volume of configuration.

The folder contains 6 modules at the moment:

* `cluster` module allows to create new Kubernetes clusters.
* `firewall/ingress-allow` module allows to create firewall rules to filter incoming traffic.
* `node-pool` module is used to create [Node Pools](https://cloud.google.com/kubernetes-engine/docs/concepts/node-pools) which is mechanism to add extra nodes of required configuration to a running Kubernetes cluster. Note that nodes which configuration is specified in the `cluster` module become the _default_ node pool (changing in the number of nodes will add or reduce the number of nodes).
  * `node-pool variables` under terraform-modules/node-pool/variebles.tf file change the type of machin disksize etc ..  
* `extra-pool` module is used to create [Node Pools] to add extra nodes of required configuration to a running Kubernetes cluster (changing in the number of nodes will add or reduce the number of nodes).  
  * `extra-pool variables` under terraform-modules/extra-pool/variebles.tf file change the type of machin disksize etc ..  
* `vpc` module is used to create new Virtual Private Cloud (VPC) networks.
* `db` module is used to create new SQL database.
  * `db variables` under terraform-modules/db/vars.tf file change the type of sql database disksize etc ..  
 
### prod-cluster
Inside the **prod-cluster** folder, I put terraform configuration for the creation and management  of Kubernetes cluster.

Important files here:

* `main.tf` is the place where we define main configuration such as creation of a network for our cluster, creation of the cluster itself and node pools etc... .
* `firewall.tf` is used to describe the firewall rules regarding our cluster.
* `static-ips.tf` is used to manage static IP addresses for services and applications which will be running in the cluster.
* `terraform.tfvars` contains terraform input variables which you need to define before you can start creating a cluster.
* `outputs.tf` contains output variables
* `variables.tf` contains input variables

