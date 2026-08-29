terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}


provider "google" {
  project = "learning-486115"
  region  = "us-east1"
  zone    = "us-east1-b"
}

terraform {
  backend "gcs" {
    bucket = "learning-486115-tfstate"
    prefix = "terraform/state"
  }
}


module "network" {
  source       = "./modules/network"
  network_name = "nginx-demo-app"
  subnet_name  = "nginx-demo-subnet"
  subnet_cidr  = "10.2.0.0/24"
  region       = "us-east1"
}

module "compute" {
  source    = "./modules/compute"
  subnet_id = module.network.subnet_id
}




