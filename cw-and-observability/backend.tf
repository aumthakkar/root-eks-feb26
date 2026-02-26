terraform {
  backend "s3" {
    region = "eu-north-1"
    key    = "cw-obs/terraform.tfstate"
    bucket = "pht-dev-cw-observability"

    use_lockfile = true
    encrypt      = true
  }

}