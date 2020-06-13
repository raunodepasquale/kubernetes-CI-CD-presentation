resource "kubernetes_storage_class" "tfstorageclass" {
  metadata {
    name = "mongodelete"
  }
  storage_provisioner = "kubernetes.io/azure-file"
  reclaim_policy      = "Delete"
  parameters = {
    skuName = "Standard_LRS"
  }
 }