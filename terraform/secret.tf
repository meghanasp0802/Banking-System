resource "kubernetes_secret" "banking_secret" {
  metadata {
    name = "banking-secret"
  }

  type = "Opaque"

  data = {
    DB_USERNAME = "root"
    DB_PASSWORD = "123456"
  }
}