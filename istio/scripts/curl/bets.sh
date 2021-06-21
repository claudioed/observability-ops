#!/usr/bin/env bash

set -e

watch -n 0,2 "curl -X POST 'http://localhost:80/api/bets' \
    --header 'Content-Type: application/json' \
    --data-raw '{}' \
    -s -w '\n%{time_total}s %{http_code}\n' "