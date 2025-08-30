#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

if ! command -v aws &> /dev/null
then
    echo "aws could not be found"
    exit
fi

if ! command -v gomplate &> /dev/null
then
    echo "gomplate could not be found"
    exit
fi

if [ -z "$1" ]
then
    echo "Missing the input argument of module path"
fi

if ! aws sts get-caller-identity &> /dev/null
then
    echo "could not authenticate with AWS"
    exit
fi

if [ ! -f "/tmp/regions.json" ]; then
    aws ec2 describe-regions --all-regions --query 'Regions' > /tmp/regions.json
fi

export MODULE_PATH="$1"
gomplate \
    --file "$ROOT_DIR/templates/modules.tf.tpl" \
    --out "$ROOT_DIR/modules.tf" \
    --datasource source=env:MODULE_PATH \
    --datasource regions=/tmp/regions.json \
    --template variables="file://$ROOT_DIR/app/module.tf.tpl"
