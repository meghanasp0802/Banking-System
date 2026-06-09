resource "kubernetes_deployment" "registry" {

  metadata {
    name = "registry-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "registry"
      }
    }

    template {

      metadata {
        labels = {
          app = "registry"
        }
      }

      spec {

        container {

          name  = "registry"
          image = "dockermspyq/service-registry:19"

          image_pull_policy = "Always"

          port {
            container_port = 8761
          }
        }
      }
    }
  }
}