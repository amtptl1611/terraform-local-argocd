
locals {
  argocd_namespace = var.argocd_namespace
}

resource "kubernetes_namespace_v1" "argocd_namespace" {
  metadata {
    name = local.argocd_namespace
  }
}

resource "helm_release" "argocd" {
  name = "argocd"
  repository = "https://amtptl1611.github.io/argo-helm/"
  chart = "argo-cd"
  version = "3.4.0"

  namespace = local.argocd_namespace


  depends_on = [
    kubernetes_namespace_v1.argocd_namespace
  ]

}