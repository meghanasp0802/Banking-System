resource "kubernetes_deployment" "notification_service" {

  metadata {
    name = "notification-service-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "notification-service"
      }
    }

    template {

      metadata {
        labels = {
          app = "notification-service"
        }
      }

      spec {

        container {

          name  = "notification-service"
          image = "dockermspyq/notification-service:19"

          image_pull_policy = "Always"

          port {
            container_port = 8084
          }

          env {
            name  = "EUREKA_CLIENT_SERVICEURL_DEFAULTZONE"
            value = "http://registry-service:8761/eureka"
          }

          env {
            name  = "SPRING_DATASOURCE_URL"
            value = "jdbc:mysql://host.docker.internal:3306/notification_db"
          }

          env {
            name  = "SPRING_DATASOURCE_USERNAME"
            value = "root"
          }

          env {
            name = "SPRING_DATASOURCE_PASSWORD"

            value_from {
              secret_key_ref {
                name = "banking-secret"
                key  = "DB_PASSWORD"
              }
            }
          }
        }
      }
    }
  }
}