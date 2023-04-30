terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.73"
}


provider "yandex" {
  token = var.access_token
  # cloud_id  = ""
  folder_id = var.access_folder_id
  zone      = "ru-central1-b"
}  

#- - - - - - - - - - vm_1 - - - - - - - - - - - 
 
resource "yandex_compute_instance" "nginx-1" {
  name     = "vm-nginx-1"
  hostname = "nginx-1"
  zone     = "ru-central1-b"


  resources {
    cores         = 2
    memory        = 2 
    core_fraction = 20
  }


  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 5
    }
  }


  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-nginx_1.id
    ip_address = "192.168.1.11"
    nat        = true
  }
  metadata = {
    user-data = "${file("./meta.txt")}"
  }
 
}

 #- - - - - - - - - - -vm_2 - - - - - - - - - - - 

resource "yandex_compute_instance" "nginx-2" {
  name     = "vm-nginx-2"
  hostname = "nginx-2"
  zone     = "ru-central1-a"


  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }


  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 5
    }
  }


  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-nginx_2.id
    ip_address = "192.168.2.22"
    nat        = true
  }
  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}

