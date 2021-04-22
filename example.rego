# package name coresponds to /v0/data/httpapi/authz endpoint
package httpapi.authz

# response prefix as "/instance" and "/refresh"
instance = response
refresh = response

# set "provider" from the input
provider = input.provider {input.provider}

# set "domain" from the input
domain = input.domain {input.domain}

# set "service" from the input
service = input.service {input.service}

# set "attestationData" from the input
attestationData = input.attestationData {input.attestationData}

# overwrite "certRefresh" to false whether if it is defined as true or false
certRefresh = false {
  input.attributes.certRefresh == true
} else = false
attributes = json.patch(input.attributes, [{"op": "add", "path": "/certRefresh", "value": certRefresh}])

# response payload
# since ZTS will only check the status code, setting the response will let the certificate to be issued
#default response = {}
response = {
  "provider": provider,
  "domain": domain,
  "service": service,
  "attestationData": attestationData,
  "attributes": attributes
}
