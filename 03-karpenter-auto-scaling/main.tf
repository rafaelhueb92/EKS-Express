terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17"
    }
  }

  backend "s3" {
    bucket = "not-so-simple-ecommerce-terraform-state-files-180294221572"
    key    = "karpenter-auto-scaling/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.auth.region

  default_tags {
    tags = var.tags
  }

  assume_role {
    role_arn     = var.auth.assume_role_arn
  }
}

provider "helm" {
  kubernetes {
    host                   = local.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(local.eks_cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", local.eks_cluster_name]
      command     = "aws"
    }
  }
}