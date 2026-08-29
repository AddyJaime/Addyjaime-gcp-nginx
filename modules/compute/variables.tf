variable "subnet_id" {
  type = string
  description = "ID de la subnet donde va la VM"
}
#Piénsalo así, bro: variable "subnet_id" es solo un hueco vacío que dice "aquí VA a llegar un ID de subnet, pero todavía no sé cuál". Es como una caja etiquetada, pero vacía.
# ¿Quién la llena? El root. El valor NO se guarda aquí en el módulo. Se guarda cuando el root llama a compute y le pasa el valor.
