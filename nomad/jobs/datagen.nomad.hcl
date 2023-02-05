job "datagen" {
  datacenters = ["dc1"]

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "linux"
  }

  group "datagen" {
    count = 1
    
    network {
      mode = "bridge"

      port "http" { }
    }

    service {
      name = "datagen"

      connect {
        sidecar_service { 
          proxy {
            upstreams {
              destination_name = "counter-api"
              local_bind_port  = 5002
            }
          }
        }
      }
    }

    task "datagen" {
      driver = "docker"

      config {
        image = "ghcr.io/thangchung/coffeeshop-on-nomad/datagen-app:0.1.1"
        // force_pull = true
      }

      env {
        ASPNETCORE_ENVIRONMENT = "Development"
        CoffeeShopApi = "http://${NOMAD_UPSTREAM_ADDR_counter_api}"
        SubmitOrderRoute = "/v1/api/orders"
      }

      resources {
        cpu    = 70
        memory = 150
      }
    }
  }
}
