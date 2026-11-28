#!/usr/bin/env bash
#
# Apply the optional sync settings from the environment with `ob sync-config`.
# Each is applied only when the variable is SET: an empty value clears the
# setting (SYNC_CONFIGS= turns settings sync off), unset leaves ob's own value.
# See `ob sync-config --help` for the accepted values.
#
# The entry point runs this before every `ob sync`, so sync never starts on
# settings the environment doesn't ask for, and a changed variable takes
# effect on restart. `bootstrap` runs it too, so its status output is accurate.
#
set -euo pipefail
VAULT_PATH="${VAULT_PATH:-/vault}"

args=()
[ -n "${SYNC_CONFIGS+x}" ] && args+=(--configs "$SYNC_CONFIGS")
[ -n "${SYNC_FILE_TYPES+x}" ] && args+=(--file-types "$SYNC_FILE_TYPES")
[ "${#args[@]}" -eq 0 ] || ob sync-config --path "$VAULT_PATH" "${args[@]}"
