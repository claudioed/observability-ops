#!/usr/bin/env bash

set -e

watch -n 0,1 "curl -X POST 'http://localhost:9999/api/bets' \
    --header 'Content-Type: application/json' \
    --data-raw '{}' \
    -s -w '\n%{time_total}s %{http_code}\n' "