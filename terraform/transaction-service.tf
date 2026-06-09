resource "kubernetes_service" "transaction_service" {

  metadata {
    name = "transaction-service"
  }

  spec {

    selector = {
      app = "transaction-service"
    }

    port {
      port        = 8083
      target_port = 8083
      protocol    = "TCP"
    }

    type = "NodePort"
  }
}