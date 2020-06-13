resource "kubernetes_resource_quota" "tfresourcequota" {
  metadata {
    name = "database-resourcequota"
    namespace = var.namespace
  }
  spec {
    hard = {
      requests.cpu: "2"
      requests.memory: "2Gi"
      limits.cpu: "3"
      limits.memory: "4Gi"
    }
  }
}