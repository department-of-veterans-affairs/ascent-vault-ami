#-------------------------------------------
# Secret Policy for Kibana Service
#-------------------------------------------

# Needs read access to SSL certificates stored in secret/kibana
path "secret/kibana" {
    capabilities = ["read"]
}