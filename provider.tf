# Talks to libvirt on Linux on what should happen
terraform {
    required_providers {
      libvirt = {
        source = "dmacvicar/libvirt"
        version = "~> 0.9"
      }
    }
}

provider "libvirt" {
    uri = "qemu+ssh://dexter-1@master/system?known_hosts_verify=ignore"

}


# Module for pool creation and provisioning
module "pool" {
  source = "./pool"
  providers = {
    libvirt = libvirt
  }
}
