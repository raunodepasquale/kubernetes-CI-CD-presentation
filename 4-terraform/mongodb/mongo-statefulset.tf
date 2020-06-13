resource "kubernetes_service" "tfservice" {
  metadata {
    name = "mongo-hlservice"
    namespace = var.namespace
    labels = {
      name = "mongo"
      namespace = var.namespace
    }
  }
  spec {
    selector = {
      role = kubernetes_stateful_set.tfmongo.metadata.0.labels.role
    }
    port {
      port        = 27017
      target_port = 27017
    }
    cluster_ip = None
  }
}

resource "kubernetes_stateful_set" "tfmongo" {
  metadata {
    labels = {
      role          = "mongo"
      environment   = "test"
    }
    name = "mongo"
    namespace = var.namespace
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        role = "mongo"
      }
    }
    service_name = kubernetes_service.tfservice.metadata.metadata.name
    template {
      metadata {
        labels = {
          role = "mongo"
        }
      }
      spec {
        container {
          name              = "mongo"
          image             = "mongo:4.0.12"
          image_pull_policy = "IfNotPresent"
          command = [
            "mongod",
            "--replSet",
            "mongok8s",
            "--smallfiles",
            "--noprealloc",
            "--bind_ip",
            "0.0.0.0"
          ]
          port {
            container_port = 27017
          }
          volume_mount {
            name       = "mongo-persistent-storage"
            mount_path = "/data/db"
          }
        }
        container {
          name              = "mongo-sidecar"
          image             = "cvallance/mongo-k8s-sidecar"
          image_pull_policy = "IfNotPresent"
          env {
              name = "KUBE_NAMESPACE"
              value =  var.namespace
            }   
          env {     
              name = "MONGO_SIDECAR_POD_LABELS"
              value = "role=mongo,environment=test"
            }  
          env { 
              name = "KUBERNETES_MONGO_SERVICE_NAME"
              value = "mongo-hlservice"
            }  
          env {
              name = "KUBERNETES_CLUSTER_DOMAIN"
              value = "cluster.local" 
              }
        }
      }
    volume_claim_template {
      metadata {
        name = "mongo-persistent-storage"
      }

      spec {
        access_modes       = ["ReadWriteOnce"]
        storage_class_name = "mongodelete"

        resources {
          requests = {
            storage = "1Gi"
          }
        }
      }
    }
  }
}