#####################################################################
# Creates Elastic Kubernetes Service (EKS) Managed Node Group (MNG) #
#####################################################################

resource "aws_eks_node_group" "group" {
  ami_type             = var.kubernetes_node_image_type
  capacity_type        = var.kubernetes_node_capacity_type
  cluster_name         = var.kubernetes_cluster_name
  disk_size            = var.kubernetes_node_disk_size
  force_update_version = var.kubernetes_node_force_updates
  instance_types       = var.kubernetes_node_instance_types
  labels               = var.kubernetes_node_labels
  node_group_name      = var.kubernetes_node_group_name
  node_role_arn        = var.kubernetes_node_role_arn
  subnet_ids           = var.kubernetes_node_subnet_ids
  tags                 = var.kubernetes_node_tags

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size,
    ]
  }

  dynamic "remote_access" {
    for_each = var.kubernetes_node_ssh_key != null ? [1] : []

    content {
      ec2_ssh_key               = var.kubernetes_node_ssh_key
      source_security_group_ids = var.kubernetes_node_allowed_security_groups
    }
  }

  scaling_config {
    desired_size = var.kubernetes_node_group_desired_size
    max_size     = var.kubernetes_node_group_max_size
    min_size     = var.kubernetes_node_group_min_size
  }

  dynamic "taint" {
    for_each = var.kubernetes_node_taints

    content {
      effect = taint.value["effect"]
      key    = taint.value["key"]
      value  = taint.value["value"]
    }
  }

  update_config {
    max_unavailable = var.kubernetes_node_group_max_unavailable
  }
}
