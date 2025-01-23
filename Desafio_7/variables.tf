variable "region" {
  default = "us-east-1"
}

variable "bucket_name" {
  default = "kh-bucket"
}

variable "cloudfront_comment" {
  default = "Distribución de CloudFront para el sitio estático"
}

variable "web" {
  default = "index.html"
}
