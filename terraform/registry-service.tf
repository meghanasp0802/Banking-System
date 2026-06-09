resource "kubernetes_service" "registry" {

  metadata {
    name = "registry-service"
  }

  spec {

    selector = {
      app = "registry"
    }

    port {
      port        = 8761
      target_port = 8761
      protocol    = "TCP"
    }

    type = "NodePort"
  }
}