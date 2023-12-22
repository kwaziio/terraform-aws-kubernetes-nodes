###########################################################################
# AWS Elastic Kubernetes Service (EKS) [Kubernetes] Cluster Configuration #
###########################################################################

variable "kubernetes_cluster_name" {
  description = "Name to Assign to the Created EKS Cluster"
  type        = string
}

########################################################################
# AWS Elastic Kubernetes Service (EKS) [Kubernetes] Node Configuration #
########################################################################

variable "kubernetes_node_allowed_security_groups" {
  default     = []
  description = "VPC Security Group IDs to Granted SSH and RDP Access to Nodes"
  type        = list(string)
}

variable "kubernetes_node_capacity_type" {
  description = "Desired Capacity Type for Managed Nodes (ON_DEMAND or SPOT)"
  type        = string
}

variable "kubernetes_node_disk_size" {
  description = "Root Disk Size Assigned to Managed Nodes (in GB)"
  type        = number
}

variable "kubernetes_node_force_updates" {
  description = "'true' if Updates Should be Forced if Blocked by Pod Disruption Budget"
  type        = bool
}

variable "kubernetes_node_group_desired_size" {
  description = "Desired Number of Operational Kubernetes Nodes"
  type        = number
}

variable "kubernetes_node_group_max_size" {
  description = "Maximum Number of Allowable Nodes While Performing Scaling Actions"
  type        = number
}

variable "kubernetes_node_group_max_unavailable" {
  description = "Maximum Number of Allowable Unavailable Nodes While Updating"
  type        = number
}

variable "kubernetes_node_group_min_size" {
  description = "Minimum Number of Allowable Nodes While Performing Scaling Actions"
  type        = number
}

variable "kubernetes_node_group_name" {
  description = "Name to Assign to Created Group of Kubernetes Nodes"
  type        = string
}

variable "kubernetes_node_image_type" {
  description = "Desired Image Type for Created Nodes (Required w/ Fully-Managed Images)"
  type        = string
}

variable "kubernetes_node_instance_types" {
  description = "List of Acceptable Instance Types for Kubernetes Nodes"
  type        = list(string)
}

variable "kubernetes_node_labels" {
  default     = {}
  description = "Kubernetes Labels to be Assigned to Kubernetes Nodes"
  type        = map(string)
}

variable "kubernetes_node_role_arn" {
  description = "ARN of the IAM Role to be Assigned to Kubernetes Nodes"
  type        = string
}

variable "kubernetes_node_ssh_key" {
  default     = null
  description = "Name of the AWS EC2 Key Pair to Utilize for SSH Connections"
  type        = string
}

variable "kubernetes_node_subnet_ids" {
  description = "List of Permitted VPC Subnet IDs Allowed to Host Kubernetes Nodes"
  type        = list(string)
}

variable "kubernetes_node_tags" {
  default     = {}
  description = "AWS Resource Tags to be Assigned to Created Kubernetes Nodes"
  type        = map(string)
}

variable "kubernetes_node_taints" {
  default     = []
  description = "Kubernetes Taints to be Assigned to Kubernetes Nodes"

  type = list(object({
    effect = string
    key    = string
    value  = string
  }))
}

##################################
# Created Resource Configuration #
##################################

variable "resource_tags" {
  default     = {}
  description = "Map of AWS Resource Tags to Assign to All Created Resources"
  type        = map(string)
}
