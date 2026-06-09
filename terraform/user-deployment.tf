resource "kubernetes_deployment" "user_service" {

  metadata {
    name = "user-service-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "user-service"
      }
    }

    template {

      metadata {
        labels = {
          app = "user-service"
        }
      }

      spec {

        container {

          name  = "user-service"
          image = "dockermspyq/user-service:19"

          image_pull_policy = "Always"

          port {
            container_port = 8081
          }

          env {
            name  = "EUREKA_CLIENT_SERVICEURL_DEFAULTZONE"
            value = "http://registry-service:8761/eureka"
          }

          env {
            name  = "SPRING_DATASOURCE_URL"
            value = "jdbc:mysql://host.docker.internal:3306/user_db"
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