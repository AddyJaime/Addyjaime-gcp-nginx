data "google_compute_image" "my_vm_image" {
  family  = "debian-12"
  project = "debian-cloud"

}

resource "google_compute_instance" "nginx_vm" {
  name         = "nginx-demo-vm"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_vm_image.id


    }
  }

  network_interface {
    subnetwork = var.subnet_id
    access_config { #esot le da la ip publica a mi vm 

    }
  }

  metadata_startup_script = <<-EOT
  #!/bin/bash
  apt-get update
  apt-get install -y curl 
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh ./get-docker.sh 
  docker run --name my-nginx -d -p 80:80 nginx 
  EOT
}

#conecta el puerto de la vm al puerto del contneodr 80:80 