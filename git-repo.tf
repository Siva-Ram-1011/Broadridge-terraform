terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.22.0"
    }
  }
}

provider "github" {
  token = ""
}


# --- go to github , developer settings
# ---- generate a token in github to add it into the iac
# --- add the permissions for repo

# token : 

# add the token in above iac

# ----  https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository

# -- add the repo to git account using iac

resource "github_repository" "repo" {
  name        = "terraform-repo"
  description = "tf-testrepo"

  visibility = "private"


}

