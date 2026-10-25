terraform {
  cloud {
    organization = "thawzin-tfc"
    workspaces {
      name = "workspace-control"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.82.0"
    }
  }
}


provider "tfe" {
  organization = "thawzin-tfc"
}
