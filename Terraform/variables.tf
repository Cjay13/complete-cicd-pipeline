variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "dbPassowrd" {
  description = "RDS password"
  type        = string
  default     = "admin123"
  sensitive   = true
}