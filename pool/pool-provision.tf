# Provisioner creates vm-images directpry for storage pool
resource "null_resource" "create_vm-images" {
  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/dexter-1/vm-images"
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
