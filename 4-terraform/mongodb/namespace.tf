resource "kubernetes_namespace" "tfnamespace" {

    labels = {
      name = var.namespace
    }

    name = var.namespace
  }
