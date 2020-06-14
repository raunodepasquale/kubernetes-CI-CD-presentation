variable "namespace" {
  description = "Value for the namespace name"
  default = "terraformdbdemo"
}

variable "mongoservicename" {
  description = "Value for the name of the service exposing mongo stateful set"
  default = "mongo-hlservice"
}