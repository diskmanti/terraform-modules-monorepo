terraform {
  required_version = "~> 1.7"
  required_providers {

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.18.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.35.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.16.1"
    }
    kind = {
      source  = "tehcyx/kind"
      version = ">= 0.6.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.3"
    }
  }
}