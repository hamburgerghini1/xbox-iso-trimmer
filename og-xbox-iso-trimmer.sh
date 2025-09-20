#!/usr/bin/env bash
set -euo pipefail

# Directory where your Xbox ISOs are
ISO_DIR="$PWD"
# Output directory for trimmed ISOs
OUT_DIR="$ISO_DIR/trimmed"

mkdir -p "$OUT_DIR"

for iso in "$ISO_DIR"/*.iso; do
    [ -e "$iso" ] || continue

    base="$(basename "$iso" .iso)"

    echo ">>> Processing: $base"

    # Rewrite ISO as optimized (trimmed)
    extract-xiso -r "$iso" -d "$OUT_DIR"

    # Rename output (extract-xiso just keeps .iso extension)
    mv "$OUT_DIR/$base.iso" "$OUT_DIR/$base.trimmed.iso"

    echo ">>> Done: $OUT_DIR/$base.trimmed.iso"
done

echo "All ISOs processed! Trimmed versions are in: $OUT_DIR"
