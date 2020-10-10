#!/bin/bash

# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

URL="https://github.com/acaudwell/Gource/releases/download/$(get_latest_release "acaudwell/Gource")/gource-0.51.tar.gz"

mkdir gource
curl -s --location "$URL" | tar xz -C gource/
