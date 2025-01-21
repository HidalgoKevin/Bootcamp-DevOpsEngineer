output "cloudfront_url" {
  value = aws_cloudfront_distribution.cf.domain_name
  description = "URL del sitio web servido por CloudFront"
}
