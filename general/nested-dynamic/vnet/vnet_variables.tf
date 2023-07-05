variable resource_group_name {}
variable location {}

variable tags {
  type = map(string)
}

variable vnet_name {}
variable subnet_map  {
  type = map(object({
            service_endpoints   = optional(list(string))
            address_prefixes    = list(string)
            enforce_private_link_endpoint_network_policies = optional(bool, null)
            network_security_group_id = optional(string)
            delegations = optional(map(object({
              delegation_name = string
              delegation_actions = list(string)
            })), {})
        }))
}

variable vnet_cidr {}
variable dns_servers {
  type = list
  default = ["168.63.129.16"]
}

