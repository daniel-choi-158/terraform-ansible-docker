variable "user" {
  default = "dchoi5"
}

variable "region" {
  default = "us-central1"
}

variable "region_zone" {
  default = "us-central1-a"
}

variable "project_name" {
    default = "practice-space-250608"
    description = "The ID of the Google Cloud project"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/Terraform.json"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/gcloud_id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default = "~/.ssh/gcloud_id_rsa"
}

variable "github_token" {
  description = "Github API token to be used by Terraform"
}

variable "github_organization" {
  default = "daniel-choi-158"
}