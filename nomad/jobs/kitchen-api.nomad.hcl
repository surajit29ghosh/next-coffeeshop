variable "docker-image-version" {
  type        = string
  default     = "latest"
  description = "the docker image version"
}

job "kitchen-api" {
  datacenters = ["dc1"]

  constraint {
    attribute = "${attr.kernel.name}"
    value     = "linux"
  }

  group "kitchen-api" {
    count = 1
    
    network {
      mode = "bridge"

      port "http" { 
        to = 5004 
      }
    }

    service {
      name = "kitchen-api"
      port = "5004"
      address = "${attr.unique.network.ip-address}"
    }

    task "kitchen-api" {
      driver = "docker"

      config {
        image = "ghcr.io/thangchung/coffeeshop-on-nomad/kitchen-service:${var.docker-image-version}"
        ports = [ "http" ]
        // force_pull = true
      }

      env {
        ASPNETCORE_ENVIRONMENT = "Development"
        ConnectionStrings__kitchendb = "Server=${attr.unique.network.ip-address};Port=5432;Database=postgres;User Id=postgres;Password=P@ssw0rd"
        RabbitMqUrl = "${attr.unique.network.ip-address}"
        UseTracingExporter = "console1"
        UseMetricsExporter = "console1"
        UseLogExporter = "console1"
        AspNetCoreInstrumentation__RecordException = true
      }

      resources {
        cpu    = 100
        memory = 200
      }
    }
  }
}
