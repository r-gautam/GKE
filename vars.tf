variable "cluster_name" {
  type        = string
  description = "Name of the cluster."
}

variable "project" {
  type        = string
  description = "The project ID to create the cluster."
}

variable "region" {
  type        = string
  description = "The region to create the cluster."
}


variable "node_pool_name" {
  type        = string
  description = "Name of the node pool"
}


variable "network_name" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}

variable "subnet_name" {
  description = "The subnetwork created to host the cluster in"
  
}


variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-scv"
}


variable "router_name" {
  description = "name of the router"
  
}

variable "nat_name" {
  description = "name of the nat"
  
}

# variable "machine_type" {
#   type        = string
#   description = "Type of the node compute engines."
# }

# variable "min_count" {
#   type        = number
#   description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
# }

# variable "max_count" {
#   type        = number
#   description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
# }


