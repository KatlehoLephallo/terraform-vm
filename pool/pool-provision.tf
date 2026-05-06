# Provisioner creates vm-images directpry for storage pool
resource "null_resource" "create_vm-images" {
  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/dexter-1/vm-images",
    ]
  }


    # Connects with ssh to create the directory
  connection {
    type        = "ssh"
    user        = "dexter-1"
    host        = "master"
    private_key = file("~/.ssh/id_ed25519")
  }
}

  # It starts the pool and makes it autostart if it is not the case
resource "null_resource" "start_vm_pool" {

  provisioner "remote-exec" {
    inline = [
      "virsh pool-start vm-pool || true",
      "virsh pool-autostart vm-pool"
    ]
    
  }

    # Connects with ssh to create the directory
  connection {
    type        = "ssh"
    user        = "dexter-1"
    host        = "master"
    private_key = file("~/.ssh/id_ed25519")
  }

  depends_on = [libvirt_pool.vm_pool]

}
