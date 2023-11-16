#!/bin/bash

echo "Worker Initiated"

echo "Starting WebUI API"
python /workspace/webui.py --skip-python-version-check --skip-torch-cuda-test --skip-install --lowram --opt-sdp-attention --disable-safe-unpickle --port 3000 --api --nowebui --skip-version-check  --no-hashing &

echo "Starting RunPod Handler"
python -u /rp_handler.py
