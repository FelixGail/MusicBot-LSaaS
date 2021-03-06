resource "aws_api_gateway_model" "result_request" {
  rest_api_id  = aws_api_gateway_rest_api.api.id
  name         = "ResultRequest"
  content_type = "application/json"

  schema = <<EOF
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "ResultRequest",
  "type": "object",
  "required": [
    "token"
  ],
  "properties": {
    "token": {
      "type": "string"
    }
  }
}
EOF
}

resource "aws_api_gateway_model" "result_response" {
  rest_api_id  = aws_api_gateway_rest_api.api.id
  name         = "ResultResponse"
  content_type = "application/json"

  schema = <<EOF
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "ResultResponse",
  "type": "object",
  "required": [
    "hasCertificate"
  ],
  "properties": {
    "hasCertificate": {
      "type": "boolean"
    },
    "pem": {
      "type": "object",
      "required": [
        "crt",
        "key"
      ],
      "properties": {
        "crt": {
          "type": "string"
        },
        "key": {
          "type": "string"
        }
      }
    },
    "p12": {
      "type": "object",
      "required": [
        "p12"
      ],
      "properties": {
        "p12": {
          "type": "string"
        }
      }
    },
    "jks": {
      "type": "object",
      "required": [
        "jks"
      ],
      "properties": {
        "jks": {
          "type": "string"
        }
      }
    }
  }
}
EOF
}
