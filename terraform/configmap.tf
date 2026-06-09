resource "kubernetes_config_map" "banking_config" {
  metadata {
    name = "banking-config"
  }

  data = {
    EUREKA_URL          = "http://registry-service:8761/eureka"
    USER_DB_URL         = "jdbc:mysql://host.docker.internal:3306/user_db"
    ACCOUNT_DB_URL      = "jdbc:mysql://host.docker.internal:3306/account_db"
    TRANSACTION_DB_URL  = "jdbc:mysql://host.docker.internal:3306/transaction_db"
    NOTIFICATION_DB_URL = "jdbc:mysql://host.docker.internal:3306/notification_db"
  }
}