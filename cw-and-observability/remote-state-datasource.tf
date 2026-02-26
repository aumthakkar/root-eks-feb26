data "terraform_remote_state" "eks" {
  backend = "remote"

  config = {
    organization = "EKSTF"
    workspaces = {
      name = "feb-26"
    }
  }

}