resource "kubernetes_role" "tfrole" {
  metadata {
    name = "mongo-pod-read"
    namespace = var.namespace
  }

  rule {
    api_groups     = [""]
    resources      = ["pods"]
    resource_names = ["foo"]
    verbs          = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "tfrolebinding" {
  metadata {
    name      = "mongo-pod-read"
    namespace = var.namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.tfrole.metadata.name
  }
  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = var.namespace
  }
}