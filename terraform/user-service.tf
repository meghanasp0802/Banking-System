resource "kubernetes_service" "user_service" {

  metadata {
    name = "user-service"
  }

  spec {

    selector = {
      app = "user-service"
    }

    port {
      port        = 8081
      target_port = 8081
      protocol    = "TCP"
    }

    type = "NodePort"
  }
}