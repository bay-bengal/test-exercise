resource "aws_route53_record" "endpoint" {
  zone_id = var.domain_zone_id
  name    = join(".", [var.project_name, var.domain])
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }

  provider = aws.infra-sharedservices-deploy
}

