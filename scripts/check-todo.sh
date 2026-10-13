
#!/usr/bin/env bash

set -euo pipefail

failed=0

for file in "$@"; do
  if grep -n 'TODO' "$file"; then
    echo "ERROR: TODO found in $file"
    failed=1
  fi
done

if [ "$failed" -eq 1 ]; then
  echo "Check failed: remove TODO comments before committing."
  exit 1
fi

echo "Check passed: no TODO comments found."