###############################################################################
#
# Trusted and Client SSL Certificates
#
# Load the set of SSL certificates that will be used by our applications
# to authenticate to external partner services.
###############################################################################

# ---------------------------------------------------------------------------------------------------------------------
# Trusted Certificates
# ---------------------------------------------------------------------------------------------------------------------

resource "vault_generic_secret" "digicert-global-root-g2" {
  path = "secret/ssl/trusted/digicert-global-root-g2"

  data_json = <<EOT
{
  "certificate": ${jsonencode("-----BEGIN CERTIFICATE-----
MIIEizCCA3OgAwIBAgIQDI7gyQ1qiRWIBAYe4kH5rzANBgkqhkiG9w0BAQsFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBH
MjAeFw0xMzA4MDExMjAwMDBaFw0yODA4MDExMjAwMDBaMEQxCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxHjAcBgNVBAMTFURpZ2lDZXJ0IEdsb2Jh
bCBDQSBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANNIfL7zBYZd
W9UvhU5L4IatFaxhz1uvPmoKR/uadpFgC4przc/cV35gmAvkVNlW7SHMArZagV+X
au4CLyMnuG3UsOcGAngLH1ypmTb+u6wbBfpXzYEQQGfWMItYNdSWYb7QjHqXnxr5
IuYUL6nG6AEfq/gmD6yOTSwyOR2Bm40cZbIc22GoiS9g5+vCShjEbyrpEJIJ7RfR
ACvmfe8EiRROM6GyD5eHn7OgzS+8LOy4g2gxPR/VSpAQGQuBldYpdlH5NnbQtwl6
OErXb4y/E3w57bqukPyV93t4CTZedJMeJfD/1K2uaGvG/w/VNfFVbkhJ+Pi474j4
8V4Rd6rfArMCAwEAAaOCAVowggFWMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYDVR0P
AQH/BAQDAgGGMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMHsGA1UdHwR0MHIwN6A1oDOGMWh0dHA6Ly9jcmw0LmRp
Z2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbFJvb3RHMi5jcmwwN6A1oDOGMWh0dHA6
Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbFJvb3RHMi5jcmwwPQYD
VR0gBDYwNDAyBgRVHSAAMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2lj
ZXJ0LmNvbS9DUFMwHQYDVR0OBBYEFCRuKy3QapJRUSVpAaqaR6aJ50AgMB8GA1Ud
IwQYMBaAFE4iVCAYlebjbuYP+vq5Eu0GF485MA0GCSqGSIb3DQEBCwUAA4IBAQAL
OYSR+ZfrqoGvhOlaOJL84mxZvzbIRacxAxHhBsCsMsdaVSnaT0AC9aHesO3ewPj2
dZ12uYf+QYB6z13jAMZbAuabeGLJ3LhimnftiQjXS8X9Q9ViIyfEBFltcT8jW+rZ
8uckJ2/0lYDblizkVIvP6hnZf1WZUXoOLRg9eFhSvGNoVwvdRLNXSmDmyHBwW4co
atc7TlJFGa8kBpJIERqLrqwYElesA8u49L3KJg6nwd3jM+/AVTANlVlOnAM2BvjA
jxSZnE0qnsHhfTuvcqdFuhOWKU4Z0BqYBvQ3lBetoxi6PrABDJXWKTUgNX31EGDk
92hiHuwZ4STyhxGs6QiA
-----END CERTIFICATE-----")}
}
EOT
}



module "vetsgov-evss" {
  source= "./add-vetservices-client"
  alias = "vetsgov"
  certificate = "${var.vetsgov_certificate}"
}

module "va-internal-s2-ica1-v1" {
  source= "./add-trusted-cert"
  alias = "va-internal-s2-ica1-v1"
  certificate = "${file("${path.module}/trusted-certs/va-internal-s2-ica1-v1.pem")}"
}

module "va-internal-s2-rca1-v1" {
  source= "./add-trusted-cert"
  alias = "va-internal-s2-rca1-v1"
  certificate = "${file("${path.module}/trusted-certs/va-internal-s2-rca1-v1.pem")}"
}

module "va-internal-s2-ica2-v1" {
  source= "./add-trusted-cert"
  alias = "va-internal-s2-ica2-v1"
  certificate = "${file("${path.module}/trusted-certs/va-internal-s2-ica2-v1.pem")}"
}

resource "vault_generic_secret" "vbms" {
  path = "secret/ssl/trusted/vbms"

  data_json = <<EOT
{
  "certificate": ${jsonencode("-----BEGIN CERTIFICATE-----
MIIFAzCCA+ugAwIBAgIHPQAAABvdlDANBgkqhkiG9w0BAQsFADBKMRMwEQYKCZIm
iZPyLGQBGRYDZ292MRIwEAYKCZImiZPyLGQBGRYCdmExHzAdBgNVBAMTFlZBLUlu
dGVybmFsLVMyLUlDQTEtdjEwHhcNMTgwNDExMTUzNzQwWhcNMjEwNDEwMTUzNzQw
WjB1MQswCQYDVQQGEwJVUzERMA8GA1UECBMIVmlyaWdpbmExETAPBgNVBAcTCEN1
bHBlcGVyMRIwEAYDVQQKEwlBSURFLVZCTVMxDTALBgNVBAsTBFZCTVMxHTAbBgNV
BAMTFHZibXMuYWlkZS5vaXQudmEuZ292MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAspkEWmRJm5k81I80Gjtefhw1iL5kLQkoxg+vXHpjy0VyMd3NtTRy
9doAFHbI6HULgYPsase8fATnLwgkicwKP0YWd1NGwhMD3KL7+62jNVvLq3bioHY1
F6leGhrMLGCqbAeQnP2sTfs65hfr/A8yEK2h4Yy4VkB31pzz0qptU3IKP5xUP8+x
AMn2xqj17ZhD/gYF3jxs3hQRchh7qtpkVq/ZwmTV2p2xnxbW2RjYEaqnIOO4/MXW
n46cwGZfcWw6WIFYaDlHpjXoARDspkO/EtS3q3MWvaDYa6guMGBqz1W6Z37VdCUX
8aapDn8fykOHDY6qJkiRUbnSqyN3b/nZEwIDAQABo4IBwTCCAb0wHQYDVR0OBBYE
FJaaxmV0Yy9/zQ/u40QqZSjUbsdOMB8GA1UdIwQYMBaAFBtt3+s95eIN7xax0N5f
WBpWy+TsMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwucGtpLnZhLmdvdi9w
a2kvY3JsL1ZBLUludGVybmFsLVMyLUlDQTEtdjEuY3JsMHsGCCsGAQUFBwEBBG8w
bTBHBggrBgEFBQcwAoY7aHR0cDovL2FpYS5wa2kudmEuZ292L3BraS9haWEvdmEv
VkEtSW50ZXJuYWwtUzItSUNBMS12MS5jZXIwIgYIKwYBBQUHMAGGFmh0dHA6Ly9v
Y3NwLnBraS52YS5nb3YwCwYDVR0PBAQDAgWgMD0GCSsGAQQBgjcVBwQwMC4GJisG
AQQBgjcVCIHIwzOB+fAGgaWfDYTggQiFwqpLBoOCn2CB4ItSAgFkAgEVMB0GA1Ud
JQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDATAnBgkrBgEEAYI3FQoEGjAYMAoGCCsG
AQUFBwMCMAoGCCsGAQUFBwMBMB8GA1UdEQQYMBaCFHZibXMuYWlkZS5vaXQudmEu
Z292MA0GCSqGSIb3DQEBCwUAA4IBAQCODYVIvpsrrqYCTldzmgFXawAun50AYyj2
9rmfqVi3b2XWVRkA0Bd2BJoc0hcb7b/7gU3Ha8U3O170IUnenQoq8dArDKaqPxx7
WX8nrs4+n3FG4gQRfoNYyr6fxPsAwOMxudSb7EAV9AqDofyccKFSTyYpr6GV8eTB
KFamU/pBs+EmffMpG/9yq+2NT9hpZ7HRhdud6+iZGsL9kXVT9q/TXuslDDX30/qr
OQfgjghOu6F/5042DGMsOYU0MaAo496XdLsLnGH06nxD8oeXM1+ubrL4jCgG33xg
6w+s6MbFI69l77ANo02P5scUPXqRbnOOiDrZumdoJXzpV1c97cu0
-----END CERTIFICATE-----")}
}
EOT
}

resource "vault_generic_secret" "doc_services_vbms_client" {
  path = "secret/ssl/client/vetservices-document/vbms"

  data_json = <<EOT
{
  "certificate": ${jsonencode("-----BEGIN CERTIFICATE-----
MIIDeTCCAmGgAwIBAgIQWrVq9r7mf2VMK6T2/kthKDANBgkqhkiG9w0BAQsFADAh
MR8wHQYDVQQDDBZWQk1TIENsaWVudCBTaWduaW5nIENBMB4XDTE4MDQzMDE4NDg1
N1oXDTI4MDQyNzE4NDg1N1owKzEpMCcGA1UEAwwgZXZzcy5jbGllbnQudmJtcy5h
aWRlLm9pdC52YS5nb3YwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDR
gpEbCOQ/ldK7cLBWYFwzwgDN/RwVwKi5EHUCADrzc/VQ0zSDR8RTtCMuXEfixShH
NaBdaKrG3pj6FmuD7GOWPsrycebKez9gp/CTue4J7B6I7ftuKpAR8WfEMZdgvLZx
7wvOAe/KfosrdzPIVLPtICTyVyjvvDYH2Tq3W6Er3LXbzbMRd6CV/io/ljxU8o7J
bVM2GAfAhGCqPTIBaB8eIO3g0nt+g2T+fpd6JH2RKONtwIKWnwNlm+dq64GEoXx4
VOldNIDteIb7E+jkacJLC1pPCtT+tr57Nf0/wPA0KzHsNbBmzh2mERlvcv0c3+sO
dKOX8ERmqDq0aEpqdcWnAgMBAAGjgaIwgZ8wCQYDVR0TBAIwADAdBgNVHQ4EFgQU
B5Zm00qVTdkHZhwKMqa/pcVQv6IwUQYDVR0jBEowSIAUmAEfMZpVATyC4TPqJV+m
9kr9I1ChJaQjMCExHzAdBgNVBAMMFlZCTVMgQ2xpZW50IFNpZ25pbmcgQ0GCCQCo
Bt72XhyhPzATBgNVHSUEDDAKBggrBgEFBQcDAjALBgNVHQ8EBAMCB4AwDQYJKoZI
hvcNAQELBQADggEBAKqVbs4Cy1xYcpLBVcgAK/Q/d4Dsw7mS9rZXMs3eV9ZZO5eV
lMAwbWwmvcphutG9+GVPl3LxJD+W0ju5p/kl2wQpi2dQQEkq/CGi+de7tUWXdSwq
Q2xjlCRexyjAGH/z+WK/vdW6kAjCcXAlWeddvB+qiYcWOSZAorpFZzNKvaeQlCXO
RLGMY8PzUNM3sdVXEFxOsZ3a5R562OD1GZbz975AvkHf4IR6Oq4KmUVgvogwA0B7
oLe6HsqEztBfdlKTvQEbLYqwlgJ8M1L1fzF0YiW81OTpjPoj4qEhEfgGlGnMwq2B
ijW+Igy86PySB9Ec8rjPghDzKW/n40ftkQoNLoE=
-----END CERTIFICATE-----")},
"private_key": ${jsonencode(file(var.vbms_private_key_file))}
}
EOT
}

resource "vault_generic_secret" "doc_services_vbms_sign" {
  path = "secret/ssl/trusted/ebn_vbms_cert"

  data_json = <<EOT
{ 
  "certificate": ${jsonencode("-----BEGIN CERTIFICATE-----
MIIEkDCCA3igAwIBAgIBGjANBgkqhkiG9w0BAQUFADB1MQswCQYDVQQGEwJVUzER
MA8GA1UECBMIVmlyZ2luaWExETAPBgNVBAcTCEN1bHBlcGVyMRQwEgYDVQQKEwtT
Y2FubmluZyBDQTEUMBIGA1UECxMLU2Nhbm5pbmcgQ0ExFDASBgNVBAMTC1NjYW5u
aW5nIENBMB4XDTEyMTIxOTEzNTUxOVoXDTIyMTIxNzEzNTUxOVowfjELMAkGA1UE
BhMCVVMxETAPBgNVBAgTCFZpcmdpbmlhMREwDwYDVQQHEwhDdWxwZXBlcjESMBAG
A1UEChMJRUJFTkVGSVRTMRYwFAYDVQQLEw1FQkVORUZJVFMgVUFUMR0wGwYDVQQD
ExRlYmVuZWZpdHMtdWF0LWNsaWVudDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBANROOdYEuknuKixH6NGnYJMeGabdmvRIPCyAYGsRjy5vFgpK0IVX4/aN
1H3CIV6ZcH9ivw2xAzkcwauEOdXhACjMG4gjJS6B115wAX1iXHkgr+e0LGGD05bU
gtbO1leX02/ukyZtZuRXtkke4uiDEY2t2EmPQTmcESYNHZZZUHrqxzRmKCqWqnKw
4vkHo+cwhG9nZaFSgc72tL/pD3WAXsgWeGF+k6VZFmWb/oK5HrHQtFBKgIYZRitx
TgmxpmfY5pHLuwLkRFmmfkmlaydv4wKyEI5PnEhxvlOQEDvwXpeXAhYdYr2kVBAp
63TijrrywTK9AZAsfUl2h7PG+v5/HAMCAwEAAaOCASAwggEcMAkGA1UdEwQCMAAw
EQYJYIZIAYb4QgEBBAQDAgeAMDMGCWCGSAGG+EIBDQQmFiRPcGVuU1NMIEdlbmVy
YXRlZCBDbGllbnQgQ2VydGlmaWNhdGUwHQYDVR0OBBYEFBNRSr8JTYQArhVAR4cd
7juu4Q27MIGnBgNVHSMEgZ8wgZyAFFzHrpaasyE0EMLdnw9TI/+TxrmaoXmkdzB1
MQswCQYDVQQGEwJVUzERMA8GA1UECBMIVmlyZ2luaWExETAPBgNVBAcTCEN1bHBl
cGVyMRQwEgYDVQQKEwtTY2FubmluZyBDQTEUMBIGA1UECxMLU2Nhbm5pbmcgQ0Ex
FDASBgNVBAMTC1NjYW5uaW5nIENBggkAxMbd9g9QeCwwDQYJKoZIhvcNAQEFBQAD
ggEBANPNIpRkTNXiNBibKWbttoELBAscjS75cJygLR0IrYFZ5NSlSj3Jf82YKh9X
rgqqzqhAsG/3SqZCwjNd8kjsJjGcPPxYAcXYMDUohE7Y11ftxtlKi3mcvtNCdh81
MBK/5MSGMnsLIsw3KESCFf/2efj1f+KvIJqxwcEME8yOIRlytKhb30pHEMQ4/vDy
RGhjGO99vw5z6qzeQ0w+JaVeg2OmlswlocCCSbJhs8Wr71pqpvfuKmxVACc/WrTz
mzsUmlS8nF+97Z0mN4uy16Mj0B26774MpQYMI3O80zAsyxSyFT6afkrTXASqRMCt
/4smTew4LhEb3YxdXV2Khiu4wRY=
-----END CERTIFICATE-----")}
}
EOT
}
resource "vault_generic_secret" "doc_services_vbms_crypto" {
  path = "secret/ssl/trusted/vbms_cert"

  data_json = <<EOT
{ 
  "certificate": ${jsonencode("-----BEGIN CERTIFICATE-----
MIIDfzCCAmcCAQQwDQYJKoZIhvcNAQEFBQAwYzELMAkGA1UEBhMCVVMxETAPBgNV
BAgTCFZpcmdpbmlhMREwDwYDVQQHEwhDdWxwZXBlcjENMAsGA1UEChMEQUlERTEM
MAoGA1UECxMDQ0EyMREwDwYDVQQDEwhBSURFIENBMjAeFw0xMjEwMDUxMjI2NDZa
Fw0yMjEwMDMxMjI2NDZaMIGnMQswCQYDVQQGEwJVUzERMA8GA1UECBMIVmlyZ2lu
aWExETAPBgNVBAcTCEN1bHBlcGVyMS4wLAYDVQQKEyVUaGUgVVMgRGVwYXJ0bWVu
dCBvZiBWZXRlcmFucyBBZmZhaXJzMRswGQYDVQQLExJWQk1TIFVBVCBzZXJ2ZXJr
ZXkxJTAjBgNVBAMTHHZibXMuY21zLnVhdC5haWRlLm9pdC52YS5nb3YwggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEb9xOTYAPiiFpdeT3bjdSICr5Je1l
WH+BYj0w3CzPMOi/eNKz8/iOA3M/g7ECVwH0JtihCHx30jbkeWjJuvgwAxbQhHFi
4UuJCUQ/5nBbqG8jr4NMsA1ChRWVHnRxCO/NiPhK3d0qyhyyNUddWTQono++KReh
qFmyOdPtF7oHCBBA6Ywbn6CCb0Nohxl/CIhBpk2fBJ8xDA5X01eZGpMQGcy33MBU
K25Rf2QCI9/7Xsr3PZItxNTotiPSTod5gg30qZNsEoYrhpBSjrW4TyObk1jMixcx
WaPDLB0p0RF63EPRD2lMz2A1UqNThNQzUu60IT9oJwUVm3vqqhD2DIAJAgMBAAEw
DQYJKoZIhvcNAQEFBQADggEBAGNIRgY54vLs6ZsfZ3+76783u9HZw5zl49fgRmEu
jMONRD6qEW65jvZLGNjuQm9cuYv9R/5XuvnDeALl+glYMv4+9NA9D7ZQeEayPVUP
EBP1HfSVoGkIMOhGfHkmOzB3rOkN7f66p9PvvSFke5JkbfjsRNC8ZUjEqy76Gsz9
eX9xd7usD7tzWL6YuD2yZTRVz8YNOGgzuxYPc2liZaBZiodNrD+7gxks37IUDXoC
7zqWGobGDvbO8icqy9Ml+/HGcuR6vCbBRdJsy+655GP4S4LFbPWvkp7+I2+16/h6
yVnLWQEPfjEcLWlT+QsKEBa+SWKRZurYUCYOtxGXuwbm0as=
-----END CERTIFICATE-----")}
}
EOT
}
