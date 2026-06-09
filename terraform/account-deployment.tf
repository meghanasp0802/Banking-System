resource "kubernetes_deployment" "account_service" {

  metadata {
    name = "account-service-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "account-service"
      }
    }

    template {

      metadata {
        labels = {
          app = "account-service"
        }
      }

      spec {

        container {

          name  = "account-service"
          image = "dockermspyq/account-service:19"

          image_pull_policy = "Always"

          port {
            container_port = 8082
          }

          env {
            name  = "EUREKA_CLIENT_SERVICEURL_DEFAULTZONE"
            value = "http://registry-service:8761/eureka"
          }

          env {
            name  = "SPRING_DATASOURCE_URL"
            value = "jdbc:mysql://host.docker.internal:3306/account_db"
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