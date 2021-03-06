resource "aws_api_gateway_model" "initial_request" {
  rest_api_id  = aws_api_gateway_rest_api.api.id
  name         = "InitialRequest"
  content_type = "application/json"

  schema = <<EOF
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "Initial request",
  "type": "object",
  "required": [
    "ips"
  ],
  "properties": {
    "ips": {
      "type": "array",
      "minItems": 1,
      "maxItems": 20,
      "items": {
          "type": "string",
          "minLength": 7,
          "maxLength": 15
      }
    },
    "keyFormat": {
      "type": "string",
      "enum": [
        "pem",
        "p12",
        "jks"
      ]
    }
  }
}
EOF
}

resource "aws_api_gateway_model" "domain_response" {
  rest_api_id  = aws_api_gateway_rest_api.api.id
  name         = "DomainResponse"
  content_type = "application/json"

  schema = <<EOF
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "DomainResponse",
  "type": "object",
  "required": [
    "wildcardDomain",
    "domains",
    "token"
  ],
  "properties": {
    "wildcardDomain": {
        "type": "string"
    },
    "domains": {
      "type": "array",
      "items": {
        "type": "object",
        "required": [
            "domain",
            "ip"
        ],
        "properties": {
            "domain": { "type": "string" },
            "ip": { "type": "string" }
        }
      }
    },
    "token": {
      "type": "string"
    }
  }
}
EOF
}
