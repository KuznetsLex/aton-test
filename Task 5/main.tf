terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.80"  # можно указать актуальную версию или убрать для последней
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

variable "vpc_network_id" {
  description = "ID существующей VPC-сети"
  type        = string
}

resource "yandex_vpc_subnet" "default" {
  name           = "test-subnet"
  zone           = var.zone
  network_id     = var.vpc_network_id
  v4_cidr_blocks = ["10.10.0.0/24"]
}

resource "yandex_compute_instance" "vm" {
  name        = "test-vm"
  zone        = var.zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
