#!/bin/sh

set -e
set -x

if [ "$#" -lt 4 ] || [ "$#" -gt 6 ] || [ "$#" -eq 6 ] && [ "$6" != "--no-push" ]; then
    echo "usage: $0 LOG_NAME BASE_TAG HASH VERSION ARTIFACTS_DIR [--no-push]" >&2
    exit 1
fi

log_name="$1"
base_tag="$2"
hash="$3"
version="$4"
artifacts="$5"

underscore_name="$(echo -n "$log_name" | tr - _)"

if [ "$#" -lt 6 ] ; then
    # docker push "$base_tag-$hash"
    docker push "$base_tag-$version"
fi

if [ -n "$artifacts" ]; then
    mkdir -p "$artifacts"

    log_file="$artifacts/publish-$log_name"
    (
        echo "${underscore_name}_hashed: $base_tag-$hash"
        echo "${underscore_name}_versioned: $base_tag-$version"
    ) > "$log_file"
fi
