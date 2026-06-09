resource "kubernetes_service" "account_service" {

  metadata {
    name = "account-service"
  }

  spec {

    selector = {
      app = "account-service"
    }

    port {
      port        = 8082
      target_port = 8082
      protocol    = "TCP"
    }

    type = "NodePort"
  }
}