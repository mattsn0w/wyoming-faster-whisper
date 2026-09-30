#!/bin/bash

TODAY=$(date +'%Y.%m.%d')

WPW_VERSION=${WPW_VERSION:-${TODAY}}

docker run --rm \
    --device=/dev/dri:/dev/dri \
    --workdir /usr/src \
    --entrypoint ./.venv/bin/python3 \
    wyoming-faster-whisper-xpu:"${WPW_VERSION}" \
    -u -c 'import torch; a = torch.xpu.is_available(); print("XPU Available:", a); print(f"Device Count: {torch.xpu.device_count()}\nGPU Name: {torch.xpu.get_device_name(0)}") if a else None'

