


# Create Pool for the VM storage
resource "libvirt_pool" "vm_pool" {
  name = "vm-pool"
  type = "dir"
  path = "/home/dexter-1/vm-images"
}
