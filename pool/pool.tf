terraform {
    required_providers {
      libvirt = {
        source = "dmacvicar/libvirt"
        version = "~> 0.9"
      }
    }
}


# Create Pool for the VM storage
resource "libvirt_pool" "vm_pool" {
  name = "vm-pool"
  type = "dir"
  target = {
    path = "/home/dexter-1/vm-images"
  }

  depends_on = [null_resource.create_vm-images]
}
