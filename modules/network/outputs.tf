output "subnet_id" {
  value       = google_compute_subnetwork.subnetwork.id
  description = "ID de la subnet"
}

#Un output es la forma en que un módulo (o tu proyecto) EXPONE un valor hacia afuera.