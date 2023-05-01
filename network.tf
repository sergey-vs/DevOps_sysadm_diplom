#- - - - - - - - - - VPC  - - - - - - - - - - - - - 

resource "yandex_vpc_network" "network-vpc" {
  name        = "network_project"
  description = "network for the project"
}

resource "yandex_vpc_address" "nginx-1" {
  name = "exampleAddress"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

resource "yandex_vpc_address" "nginx-2" {
  name = "exampleAddress"

  external_ipv4_address {
    zone_id = "ru-central1-b"
  }
}
