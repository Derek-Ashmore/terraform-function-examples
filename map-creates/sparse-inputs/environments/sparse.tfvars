
subnet_cidr_map = {
    "ActiveDirectory"               = "10.0.0.0/27"
    "InfoBlox"                      = "10.0.0.32/27"
    "Management"                    = "10.0.0.64/27"
    "DevOpsAgents"                  = "10.0.0.96/27"
    "Firewall-External"             = "10.0.13.0/26"
    "Firewall-Internal"             = "10.0.13.64/26"
    "PrivateLink"                   = "10.0.14.0/24"
    "GatewaySubnet"                 = "10.0.15.224/27"
}

subnet_service_endpoint_map = {
    "PrivateLink"                   = ["Microsoft.Storage", "Microsoft.Sql"]
    "DevOpsAgents"                  = ["Microsoft.Storage"]
}