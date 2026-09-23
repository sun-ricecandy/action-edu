#!/usr/bin/env bash
set -euo pipefail
BRANCH="${1:-dev}"                       # 첫 번째 인자, 없으면 dev

if [ "$BRANCH" = "main" ]; then TYPE=Release; else TYPE=Debug; fi

for ecu in bcm ipc adas; do
  echo "== $ecu ($TYPE) 빌드 =="
  SIZE=$((RANDOM % 300000))              # 실제 빌드 대신 크기를 흉내
  if [ "$SIZE" -gt 200000 ]; then
    echo "::error::$ecu 크기 초과: $SIZE"
    exit 1
  fi
  echo "   크기 $SIZE OK"
done