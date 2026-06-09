resource "kubernetes_service" "notification_service" {

  metadata {
    name = "notification-service"
  }

  spec {

    selector = {
      app = "notification-service"
    }

    port {
      port        = 8084
      target_port = 8084
      protocol    = "TCP"
    }

    type = "NodePort"
  }
}