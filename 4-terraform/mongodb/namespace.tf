resource "kubernetes_namespace" "tfnamespace" {
metadata {
    labels = {
      name = var.namespace
    }

    name = var.namespace
  }
}
