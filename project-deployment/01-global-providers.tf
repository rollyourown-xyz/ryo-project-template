# Global provider definitions for deployment
############################################

terraform {
  required_version = ">= 0.14"
  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "~> 1.5.0"
    }
  }
}

provider "lxd" {
  
  generate_client_certificates = true
  accept_remote_certificate    = true

  lxd_remote {
    name     = local.lxd_remote_name
    default  = true
  }
}
