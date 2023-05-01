#output "external_ip_address_nginx-1_1" {
#  value = yandex_compute_instance.nginx-1.network_interface.0.nat_ip_address
#}

#- - - - - - - - - - - - - - - - v_1- - - - - - - - - - - - - - - - - - - - - -
output "external_ip_address_nginx-2" {
  value = yandex_compute_instance.nginx-2.network_interface.0.nat_ip_address
}

#- - - - - - - - - - - - - - - - v_2- - - - - - - - - - - - - - - - - - - - - -
output "external_ip_address_nginx-1" {
  value = yandex_vpc_address.nginx-1.external_ipv4_address.0.address
}

