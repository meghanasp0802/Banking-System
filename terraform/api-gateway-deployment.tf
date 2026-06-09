resource "kubernetes_deployment" "api_gateway" {

  metadata {
    name = "api-gateway-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "api-gateway"
      }
    }

    template {

      metadata {
        labels = {
          app = "api-gateway"
        }
      }

      spec {

        container {

          name  = "api-gateway"
          image = "dockermspyq/api-gateway:19"

          image_pull_policy = "Always"

          port {
            container_port = 8085
          }

          env {
            name  = "EUREKA_CLIENT_SERVICEURL_DEFAULTZONE"
            value = "http://registry-service:8761/eureka"
          }
        }
      }
    }
  }
}