###################################################################################
# Provides Information for Kubernetes Cluster Resources Associated w/ this Module #
###################################################################################

output "cluster_name" {
  description = "Name Assigned to the Associated AWS Elastic Kubernetes Service (EKS) Cluster"
  value       = aws_eks_node_group.group.cluster_name
}

###########################################################################
# Provides Information for Kubernetes Resources Associated w/ this Module #
###########################################################################

output "kubernetes_version" {
  description = "Kubernetes Version Utilized by this Managed Node Group (MNG)"
  value       = aws_eks_node_group.group.version
}

#############################################################################
# Provides Information for Kubernetes Node Resources Created by this Module #
#############################################################################

output "node_capacity_type" {
  description = "Capacity Type Utilized by Nodes in this Managed Node Group (MNG)"
  value       = aws_eks_node_group.group.capacity_type
}

output "node_group_name" {
  description = "Name Assigned to the AWS Elastic Kubernetes Service (EKS) Managed Node Group (NNG)"
  value       = aws_eks_node_group.group.node_group_name
}

output "node_image_type" {
  description = "Type of Amazon Machine Image (AMI) Associated w/ Created Nodes"
  value       = aws_eks_node_group.group.ami_type
}

output "node_role" {
  description = "ARN Assigned to the AWS IAM Role Used by Nodes in this Managed Node Group (MNG)"
  value       = aws_eks_node_group.group.node_role_arn
}

###################################################################################
# Provides Information for Remote Access Configurations Associated w/ this Module #
###################################################################################

output "remote_access_enabled" {
  description = "'true' if Remote Access is Enabled for Nodes in this Managed Node Group (MNG)"
  value       = var.kubernetes_node_ssh_key
}

output "remote_access_security_group_id" {
  description = "ID of the VPC Security Group Allowed to Remotely Connect to Managed Nodes"
  value       = var.kubernetes_node_allowed_security_groups
}

###############################################################################
# Provides Information for AWS VPC Subnet Resources Associated w/ this Module #
###############################################################################

output "subnet_ids" {
  description = "ID of the Virtual Private Cloud (VPC) Subnets Associated w/ these Nodes"
  value       = aws_eks_node_group.group.subnet_ids
}
