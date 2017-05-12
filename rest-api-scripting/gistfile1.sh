#!/bin/sh

SERVER="http://192.161.14.199:10085"
URL="$SERVER/nexus/service/local/artifact/maven/content"

REPO="releases"
USER="admin:admin123"

group=$1
artifact=$2
version=$3
classifier=$4
ext=$5
filename=$6

curl --write-out "\nStatus: %{http_code}\n" \
    --request POST \
    --user $USER \
    -F "r=$REPO" \
    -F "g=$group" \
    -F "a=$artifact" \
    -F "v=$version" \
    -F "c=$classifier" \
    -F "p=$ext" \
    -F "file=@$filename" \
    "$URL"