resource "kubernetes_deployment" "transaction_service" {

  metadata {
    name = "transaction-service-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "transaction-service"
      }
    }

    template {

      metadata {
        labels = {
          app = "transaction-service"
        }
      }

      spec {

        container {

          name  = "transaction-service"
          image = "dockermspyq/transaction-service:19"

          image_pull_policy = "Always"

          port {
            container_port = 8083
          }

          env {
            name  = "EUREKA_CLIENT_SERVICEURL_DEFAULTZONE"
            value = "http://registry-service:8761/eureka"
          }

          env {
            name  = "SPRING_DATASOURCE_URL"
            value = "jdbc:mysql://host.docker.internal:3306/transaction_db"
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