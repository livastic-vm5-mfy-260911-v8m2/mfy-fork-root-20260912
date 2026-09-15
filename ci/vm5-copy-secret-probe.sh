#!/usr/bin/env bash
set -euo pipefail
if [ -n "${VM5_COPY_PROMOTION_CANARY:-}" ]; then
  echo VM5_COPY_SECRET_PRESENT_C0B17
else
  echo VM5_COPY_SECRET_ABSENT_C0B17
fi
