vm_name = {
  "CUSAZRPM2DVLT01" = {
    "zone"           = "1"
    "ip_address"     = "10.0.1.101"
    "data_disk_lun"  = "10"
    "data_disk_size" = 256
    "kv_name"        = "KEY-VAULT-01"
    "object_id_list" = ["SCRUBBED-481a-4950-9bcc-9476fee5c788" 
      , "SCRUBBED-714d-45bd-9181-2a192cd4b008"                 
    ]
    "key_permission_list" = [["Create", "WrapKey", "UnwrapKey"],["List"]]
  },
  "CUSAZRPM2DVLT02" = {
    "zone"           = "2"
    "ip_address"     = "10.0.1.102"
    "data_disk_lun"  = "10"
    "data_disk_size" = 256
    "kv_name"        = "KEY-VAULT-KV02"
    "object_id_list" = ["SCRUBBED-b2ee-4bc6-82ec-4449bd1b69b1" 
      , "SCRUBBED-714d-45bd-9181-2a192cd4b008"                 
    ]
    "key_permission_list" = [["Create", "WrapKey", "UnwrapKey"],["List"]]
  }
}