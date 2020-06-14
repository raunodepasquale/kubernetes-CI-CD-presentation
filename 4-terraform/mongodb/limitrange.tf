resource "kubernetes_limit_range" "tflimitrange" {
  metadata {
    name = "database-limit-range"
    namespace = var.namespace
  }
  spec {
    limit {
      type = "Container"   
      default = {
        cpu    = "500m"
        memory = "512Mi"
      }
      default_request = {
        cpu    = "250m"
        memory = "128Mi"
      }
    }
  }
}