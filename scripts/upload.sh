#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

tmpfile=$(mktemp /tmp/abc-script.XXXXXX)
echo "$RANDOM" > "$tmpfile"

infrastructure="$1"

buckets="$(jq "." "$infrastructure")"
jq -r '.results.value | to_entries | .[] | [.key, .value.bucket] | @tsv' data/buckets.json |
  while IFS=$'\t' read -r region bucket; do
    aws s3 cp --region "$region" "${tmpfile}" "s3://${bucket}/upload_test"
    aws s3 cp --region "$region" "${tmpfile}" "s3://${bucket}/private/$RANDOM.txt" --acl private

    if aws s3 cp --region "$region" "${tmpfile}" "s3://${bucket}/public/$RANDOM.txt" --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers; then
        echo Upload with read=uri=AllUsers should have failed
    fi

    if aws s3 cp --region "$region" "${tmpfile}" "s3://${bucket}/public/$RANDOM.txt" --grants read=uri=http://acs.amazonaws.com/groups/global/AuthenticatedUsers; then
        echo Upload with read=uri=AuthenticatedUsers should have failed
    fi

    if aws s3 cp --region "$region" "${tmpfile}" "s3://${bucket}/public/$RANDOM.txt" --acl public-read; then
        echo Upload with acl=public-read should have failed
    fi

    if aws s3 cp --region "$region" "${tmpfile}" "s3://${bucket}/public/$RANDOM.txt" --acl public-read-write; then
        echo Upload with acl=public-read-write should have failed
    fi
  done
