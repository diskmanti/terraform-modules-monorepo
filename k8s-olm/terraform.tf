terraform {
  required_version = ">= 1.1.0"
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14"
    }
    kubernetes = {
      version = "~> 2.11"
    }
    http = {}
  }
}

