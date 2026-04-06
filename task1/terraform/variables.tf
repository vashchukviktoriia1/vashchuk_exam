variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "spaces_access_key" {
  description = "DO Spaces Access Key"
  type        = string
  sensitive   = true
}

variable "spaces_secret_key" {
  description = "DO Spaces Secret Key"
  type        = string
  sensitive   = true
}