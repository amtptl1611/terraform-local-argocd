terraform {
  required_providers {
    helm = {
        source = "hashicorp/helm"
        version = "2.6.0"
    }
    
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.12.1"
    }
   
  }
}

provider "kubernetes" {
    config_paths = ["~/.kube/config"]
    config_context = "minikube"
}

provider "helm" {
  kubernetes {
    config_paths = ["~/.kube/config"]
    config_context = "minikube"
  }
}


