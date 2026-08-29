resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id

}

# ruta explicita a internet
resource "google_compute_route" "internet_route" {
  name             = "internet-route"
  dest_range       = "0.0.0.0/0"                           #"mi VM puede mandar paquetes hacia CUALQUIER destino".
  network          = google_compute_network.vpc_network.id # debe apuntar a la vpc no la subnet
  next_hop_gateway = "projects/learning-486115/global/gateways/default-internet-gateway"
}

#next_hop_gateway = la puerta de salida de tu red hacia internet.
#Cuando tu VM manda un paquete pa' internet, tiene que salir por algún lado. Ese "por dónde sale" es el gateway

resource "google_compute_firewall" "my_vm_firewall" {
  name    = "nginx-firewall"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }
  source_ranges = ["0.0.0.0/0"]

}






