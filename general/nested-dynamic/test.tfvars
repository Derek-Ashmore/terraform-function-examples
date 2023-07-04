tenant_id           = "e4c84790-11f1-4e98-b217-a1e8845807fa"
subscription_id     = "fb55307e-7677-493d-879c-623dc35ee58e"

vnet_map = {
    CUS-NBZ-SSRV-D-VNET = {
        resource_group_name = "CUS-NBZ-SSRV-D-NET-RG"
        location            = "centralus"
        address_space       = ["10.248.4.0/24"]
        region_tags         = {
            "nt:geography"  = "americas"
            "nt:dataCenter" = "centralus"
        }
        subnet_map = {
            PrivateResolverInbound = {
                address_prefixes    = ["10.248.4.32/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
            PrivateResolverOutbound = {
                address_prefixes    = ["10.248.4.80/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
            Radius = {
                address_prefixes    = ["10.248.4.48/28"]
            }
            DevOpsAgents = {
                address_prefixes    = ["10.248.4.64/28"]
                service_endpoints   = ["Microsoft.Storage", "Microsoft.Web"]
            }
            PrivateLink = {
                address_prefixes    = ["10.248.4.0/27"]
            }
            Testing = {
                address_prefixes    = ["10.248.4.80/28"]
            }
        }
    }
    EU2-NBZ-SSRV-D-VNET = {
        resource_group_name = "EU2-NBZ-SSRV-D-NET-RG"
        location            = "eastus2"
        address_space       = ["10.248.44.0/24"]
        region_tags         = {
            "nt:geography"  = "americas"
            "nt:dataCenter" = "eastus2"
        }
        subnet_map = {
            PrivateResolverInbound = {
                address_prefixes    = ["10.248.44.32/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
            PrivateResolverOutbound = {
                address_prefixes    = ["10.248.44.80/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
            Radius = {
                address_prefixes    = ["10.248.44.48/28"]
            }
            DevOpsAgents = {
                address_prefixes    = ["10.248.44.64/28"]
                service_endpoints   = ["Microsoft.Storage", "Microsoft.Web"]
            }
            PrivateLink = {
                address_prefixes    = ["10.248.44.0/27"]
            }
        }
    }
    ASE-NBZ-SSRV-D-VNET = {
        resource_group_name = "ASE-NBZ-SSRV-D-NET-RG"
        location            = "southeastasia"
        address_space       = ["10.248.108.0/24"]
        region_tags         = {
            "nt:geography"   = "apac"
            "nt:dataCenter"  = "southeastasia"
        }
        subnet_map = {
            PrivateResolverInbound = {
                address_prefixes    = ["10.248.108.0/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
            PrivateResolverOutbound = {
                address_prefixes    = ["10.248.108.16/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
        }
    }
    UKS-NBZ-SSRV-D-VNET = {
        resource_group_name = "UKS-NBZ-SSRV-D-NET-RG"
        location            = "uksouth"
        address_space       = ["10.248.85.0/24"]
        region_tags         = {
            "nt:geography"   = "emea"
            "nt:dataCenter"  = "uksouth"
        }
        subnet_map = {
            PrivateResolverInbound = {
                address_prefixes    = ["10.248.85.0/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
            PrivateResolverOutbound = {
                address_prefixes    = ["10.248.85.16/28"]
                delegations = {
                    "Microsoft.Network.dnsResolvers" = {
                        delegation_name = "Microsoft.Network/dnsResolvers"
                        delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
                    }
                }
            }
        }
    }
}