variable "DATABASE_URL" {
  type      = string
  sensitive = true
}

variable "DATABASE_USER" {
  type      = string
  sensitive = true
}

variable "DATABASE_PASSWORD" {
  type      = string
  sensitive = true
}

variable "ENVIRONMENT" {
  type      = string
  default = "prd"
}
