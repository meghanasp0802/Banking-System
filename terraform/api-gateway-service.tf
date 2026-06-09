resource "kubernetes_service" "api_gateway" {

  metadata {
    name = "api-gateway-service"
  }

  spec {

    selector = {
      app = "api-gateway"
    }

    port {
      port        = 8085
      target_port = 8085
      protocol    = "TCP"
    }

    type = "NodePort"
  }
}