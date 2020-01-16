#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e20ecb0a39b6c001a527d6c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e20ecb0a39b6c001a527d6c
curl -s -X POST https://api.stackbit.com/project/5e20ecb0a39b6c001a527d6c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e20ecb0a39b6c001a527d6c/webhook/build/publish > /dev/null
