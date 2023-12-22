# Terraform AWS Kubernetes Nodes Module by KWAZI

Terraform Module for Creating Configurable Kubernetes Nodes on Amazon Web Services (AWS) with AWS Elastic Kubernetes Service (EKS)

## Getting Started

> NOTE: This section assumes that you have Terraform experience, have already created an AWS account, and have already configured programmatic access to that account via access token, Single-Sign On (SSO), or AWS Identity and Access Management (IAM) role. If you need help, [checkout our website](https://www.kwazi.io).

The simplest way to get started is to create a `main.tf` file with the minimum configuration options. You can use the following as a template:

```HCL
###########################
# Terraform Configuration #
###########################

terraform {
  required_version = ">= 1.6.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.21"
    }
  }
}

##############################
# AWS Provider Configuration #
##############################

provider "aws" {
  // DO NOT HARDCODE CREDENTIALS (Use Environment Variables)
}

#######################################################
# Example Terraform AWS Kubernetes Nodes Module Usage #
#######################################################

module "terraform_aws_kubernetes_nodes" {
  source = "kwaziio/kubernetes-nodes/aws"

  kubernetes_cluster_name               = "REPLACE_WITH_CLUSTER_NAME"
  kubernetes_node_capacity_type         = "REPLACE_WITH_CAPACITY_TYPE"
  kubernetes_node_disk_size             = REPLACE_WITH_DISK_SIZE
  kubernetes_node_force_updates         = REPLACE_WITH_FORCE_UPDATE_DECISION
  kubernetes_node_group_desired_size    = REPLACE_WITH_DESIRED_SIZE
  kubernetes_node_group_max_size        = REPLACE_WITH_MAXIMUM_SIZE
  kubernetes_node_group_max_unavailable = REPLACE_WITH_UNAVAILABLE_SIZE
  kubernetes_node_group_min_size        = REPLACE_WITH_MINIMUM_SIZE
  kubernetes_node_group_name            = "REPLACE_WITH_NODE_GROUP_NAME"
  kubernetes_node_image_type            = "REPLACE_WITH_IMAGE_TYPE"
  kubernetes_node_instance_types        = REPLACE_WITH_INSTANCE_TYPES
  kubernetes_node_role_arn              = "REPLACE_WITH_NODE_ROLE_ARN"
  kubernetes_node_subnet_ids            = REPLACE_WITH_VPC_SUBNET_IDS
}
```

In the example above, you should replace the following templated values:

Placeholder | Description
--- | ---
`REPLACE_WITH_CLUSTER_NAME` | Replace this w/ a Cluster Name that Makes Sense for Your Use Case
`REPLACE_WITH_CAPACITY_TYPE` | Replace this w/ a Capacity Type (`ON_DEMAND` or `SPOT`)
`REPLACE_WITH_DISK_SIZE` | Replace this w/ Desired Root Volume Disk Size
`REPLACE_WITH_FORCE_UPDATE_DECISION` | Replace this w/ 'true' if Forcing Updates to Nodes
`REPLACE_WITH_DESIRED_SIZE` | Replace this w/ Ideal Number of Worker Nodes
`REPLACE_WITH_MAXIMUM_SIZE` | Replace this w/ Maximum Number of Worker Nodes
`REPLACE_WITH_UNAVAILABLE_SIZE` | Replace this w/ Maximum Number of Unavailable Worker Nodes
`REPLACE_WITH_MINIMUM_SIZE` | Replace this w/ Minimum Number of Worker Nodes
`REPLACE_WITH_NODE_GROUP_NAME` | Replace this w/ a Node Group Name that Make Sense for Your Use Case
`REPLACE_WITH_IMAGE_TYPE` | Replace this w/ Desired Image type (i.e., `AL2_x86_64`)
`REPLACE_WITH_INSTANCE_TYPES` | Replace this w/ List of Authorized Instance Types (i.e., `["t3.medium"]`)
`REPLACE_WITH_NODE_ROLE_ARN` | Replace this w/ the ARN of Your AWS IAM EKS Cluster Role
`REPLACE_WITH_VPC_SUBNET_IDS` | Replace this w/ a List of VPC Subnet IDs

## Prerequisites

TODO

## Need Help?

Working in a strict environment? Struggling to make design decisions you feel comfortable with? Want help from an expert that you can rely on -- one who won't abandon you when the job is finished?

Check us out at [https://www.kwazi.io](https://www.kwazi.io).

## Designing a Deployment

TODO

## Major Created Resources

The following table lists resources that this module may create in AWS, accompanied by conditions for when they will or will not be created:

Resource Name | Creation Condition
--- | ---
AWS EC2 Auto Scaling Group (ASG) | Always
AWS EC2 Instance(s) | When `kubernetes_node_group_desired_size` is Greater than 1
AWS EKS Managed Node Group (MNG) | Always

## Usage Examples

The following example(s) are provided as guidance:

* [examples/complete](examples/complete/README.md)
