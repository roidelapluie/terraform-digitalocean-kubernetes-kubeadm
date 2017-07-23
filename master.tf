resource "digitalocean_droplet" "kubemaster" {
    image = "centos-7-x64"
    name = "kubemaster"
    region = "ams3"
    size = "2gb"
    ssh_keys = ["${var.ssh_key}"]

    provisioner "remote-exec" {
        script = "install-kubeadm.sh"
    }

    provisioner "remote-exec" {
        script = "install-docker.sh"
    }

    provisioner "remote-exec" {
        inline = "kubeadm init"
    }

}
