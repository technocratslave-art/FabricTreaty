#!/usr/bin/env bash
set -euo pipefail

echo "--- FabricTreaty: Masking non-essential background services ---"

SERVICES_TO_MASK=(
  "packagekit"
  "fwupd"
  "avahi-daemon"
  "cups"
  "geoclue"
)

for svc in "${SERVICES_TO_MASK[@]}"; do
  sudo systemctl stop "$svc" 2>/dev/null || true
  sudo systemctl mask "$svc" 2>/dev/null || true
done

echo "--- Done ---"
