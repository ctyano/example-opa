## Document
https://www.openpolicyagent.org/docs/latest/rest-api/#get-a-document-webhook

## Start OPA Server
```
$ opa run -s example.rego &
```

## Sending a json request OPA server
```
$ curl -sv -XPOST -H "Content-Type: application/json" -d @request.json http://localhost:8181/v0/data/httpapi/authz/instance | jq -r . 
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8181 (#0)
> POST /v0/data/httpapi/authz/instance HTTP/1.1
> Host: localhost:8181
> User-Agent: curl/7.64.1
> Accept: */*
> Content-Type: application/json
> Content-Length: 350
> 
} [350 bytes data]
* upload completely sent off: 350 out of 350 bytes
{"client_addr":"127.0.0.1:56788","level":"info","msg":"Received request.","req_id":4,"req_method":"POST","req_path":"/v0/data/httpapi/authz/instance","time":"2021-04-22T02:54:40+09:00"}
{"client_addr":"127.0.0.1:56788","level":"info","msg":"Sent response.","req_id":4,"req_method":"POST","req_path":"/v0/data/httpapi/authz/instance","resp_bytes":162,"resp_duration":0.814988,"resp_status":200,"time":"2021-04-22T02:54:40+09:00"}
< HTTP/1.1 200 OK
< Content-Type: application/json
< Date: Wed, 21 Apr 2021 17:54:40 GMT
< Content-Length: 162
< 
{ [162 bytes data]
* Connection #0 to host localhost left intact
* Closing connection 0
{
  "attestationData": "JWT Token String",
  "attributes": {
    "certRefresh": false
  },
  "domain": "tenant.domain",
  "provider": "athenz.provider.service",
  "service": "tenant-service"
}

$ curl -sv -XPOST -H "Content-Type: application/json" -d @request.json http://localhost:8181/v0/data/httpapi/authz/refresh | jq -r . 
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8181 (#0)
> POST /v0/data/httpapi/authz/refresh HTTP/1.1
> Host: localhost:8181
> User-Agent: curl/7.64.1
> Accept: */*
> Content-Type: application/json
> Content-Length: 350
> 
} [350 bytes data]
* upload completely sent off: 350 out of 350 bytes
{"client_addr":"127.0.0.1:56825","level":"info","msg":"Received request.","req_id":5,"req_method":"POST","req_path":"/v0/data/httpapi/authz/refresh","time":"2021-04-22T02:54:55+09:00"}
{"client_addr":"127.0.0.1:56825","level":"info","msg":"Sent response.","req_id":5,"req_method":"POST","req_path":"/v0/data/httpapi/authz/refresh","resp_bytes":162,"resp_duration":0.629998,"resp_status":200,"time":"2021-04-22T02:54:55+09:00"}
< HTTP/1.1 200 OK
< Content-Type: application/json
< Date: Wed, 21 Apr 2021 17:54:55 GMT
< Content-Length: 162
< 
{ [162 bytes data]
* Connection #0 to host localhost left intact
* Closing connection 0
{
  "attestationData": "JWT Token String",
  "attributes": {
    "certRefresh": false
  },
  "domain": "tenant.domain",
  "provider": "athenz.provider.service",
  "service": "tenant-service"
}
```

## Sending an invalid json request OPA server
```
$ curl -sv -XPOST -H "Content-Type: application/json" -d @invalid_request.json http://localhost:8181/v0/data/httpapi/authz/instance | jq -r . 
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8181 (#0)
> POST /v0/data/httpapi/authz/instance HTTP/1.1
> Host: localhost:8181
> User-Agent: curl/7.64.1
> Accept: */*
> Content-Type: application/json
> Content-Length: 310
> 
} [310 bytes data]
* upload completely sent off: 310 out of 310 bytes
{"client_addr":"127.0.0.1:57250","level":"info","msg":"Received request.","req_id":7,"req_method":"POST","req_path":"/v0/data/httpapi/authz/instance","time":"2021-04-22T02:56:14+09:00"}
{"client_addr":"127.0.0.1:57250","level":"info","msg":"Sent response.","req_id":7,"req_method":"POST","req_path":"/v0/data/httpapi/authz/instance","resp_bytes":110,"resp_duration":0.256788,"resp_status":404,"time":"2021-04-22T02:56:14+09:00"}
< HTTP/1.1 404 Not Found
< Content-Type: application/json
< Date: Wed, 21 Apr 2021 17:56:14 GMT
< Content-Length: 110
< 
{ [110 bytes data]
* Connection #0 to host localhost left intact
* Closing connection 0
{
  "code": "undefined_document",
  "message": "document missing or undefined: data.httpapi.authz.instance"
}

$ curl -sv -XPOST -H "Content-Type: application/json" -d @invalid_request.json http://localhost:8181/v0/data/httpapi/authz/refresh | jq -r . 
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8181 (#0)
> POST /v0/data/httpapi/authz/refresh HTTP/1.1
> Host: localhost:8181
> User-Agent: curl/7.64.1
> Accept: */*
> Content-Type: application/json
> Content-Length: 310
> 
} [310 bytes data]
* upload completely sent off: 310 out of 310 bytes
{"client_addr":"127.0.0.1:57257","level":"info","msg":"Received request.","req_id":8,"req_method":"POST","req_path":"/v0/data/httpapi/authz/refresh","time":"2021-04-22T02:56:16+09:00"}
{"client_addr":"127.0.0.1:57257","level":"info","msg":"Sent response.","req_id":8,"req_method":"POST","req_path":"/v0/data/httpapi/authz/refresh","resp_bytes":109,"resp_duration":0.217461,"resp_status":404,"time":"2021-04-22T02:56:16+09:00"}
< HTTP/1.1 404 Not Found
< Content-Type: application/json
< Date: Wed, 21 Apr 2021 17:56:16 GMT
< Content-Length: 109
< 
{ [109 bytes data]
* Connection #0 to host localhost left intact
* Closing connection 0
{
  "code": "undefined_document",
  "message": "document missing or undefined: data.httpapi.authz.refresh"
}
```

## Sending an empty request OPA server
```
$ curl -sv -XPOST http://localhost:8181/v0/data/httpapi/authz/instance | jq -r . 
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8181 (#0)
> POST /v0/data/httpapi/authz/instance HTTP/1.1
> Host: localhost:8181
> User-Agent: curl/7.64.1
> Accept: */*
> 
{"client_addr":"127.0.0.1:56668","level":"info","msg":"Received request.","req_id":2,"req_method":"POST","req_path":"/v0/data/httpapi/authz/instance","time":"2021-04-22T02:53:47+09:00"}
{"client_addr":"127.0.0.1:56668","level":"info","msg":"Sent response.","req_id":2,"req_method":"POST","req_path":"/v0/data/httpapi/authz/instance","resp_bytes":110,"resp_duration":0.33124,"resp_status":404,"time":"2021-04-22T02:53:47+09:00"}
< HTTP/1.1 404 Not Found
< Content-Type: application/json
< Date: Wed, 21 Apr 2021 17:53:47 GMT
< Content-Length: 110
< 
{ [110 bytes data]
* Connection #0 to host localhost left intact
* Closing connection 0
{
  "code": "undefined_document",
  "message": "document missing or undefined: data.httpapi.authz.instance"
}

$ curl -sv -XPOST http://localhost:8181/v0/data/httpapi/authz/refresh | jq -r . 
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8181 (#0)
> POST /v0/data/httpapi/authz/refresh HTTP/1.1
> Host: localhost:8181
> User-Agent: curl/7.64.1
> Accept: */*
> 
{"client_addr":"127.0.0.1:56683","level":"info","msg":"Received request.","req_id":3,"req_method":"POST","req_path":"/v0/data/httpapi/authz/refresh","time":"2021-04-22T02:53:52+09:00"}
{"client_addr":"127.0.0.1:56683","level":"info","msg":"Sent response.","req_id":3,"req_method":"POST","req_path":"/v0/data/httpapi/authz/refresh","resp_bytes":109,"resp_duration":0.351361,"resp_status":404,"time":"2021-04-22T02:53:52+09:00"}
< HTTP/1.1 404 Not Found
< Content-Type: application/json
< Date: Wed, 21 Apr 2021 17:53:52 GMT
< Content-Length: 109
< 
{ [109 bytes data]
* Connection #0 to host localhost left intact
* Closing connection 0
{
  "code": "undefined_document",
  "message": "document missing or undefined: data.httpapi.authz.refresh"
}
```
