#!/usr/bin/env bash

## user with scope 'matches:read'
curl -X POST 'http://34.70.204.126/auth/realms/c4-istio/protocol/openid-connect/token' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'client_id=matches' \
    --data-urlencode 'grant_type=password' \
    --data-urlencode 'username=joao' \
    --data-urlencode 'password=admin' \
    --data-urlencode 'client_secret=9e1cb316-9939-4bc3-8904-aae4edf8065f' \
    -s -w '\n%{time_total}s %{http_code}\n'

## user with scopes 'players:read' 'bet:write' 'matches:read' 'championship:read'
#curl -X POST 'http://34.70.204.126/auth/realms/c4-istio/protocol/openid-connect/token' \
#    --header 'Content-Type: application/x-www-form-urlencoded' \
#    --data-urlencode 'client_id=championship' \
#    --data-urlencode 'grant_type=password' \
#    --data-urlencode 'username=joao' \
#    --data-urlencode 'password=admin' \
#    --data-urlencode 'client_secret=27d36b7e-986d-4fdc-9cb8-342264d0eba0' \
#    -s -w '\n%{time_total}s %{http_code}\n'