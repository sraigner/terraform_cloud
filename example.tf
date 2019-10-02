terraform {
   backend "remote" {
          organization = "scottraignerR"
          workspaces {
                name = "terraform_cloud"
          }
  }
}
