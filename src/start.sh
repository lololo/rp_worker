#!/bin/bash

echo "Worker Initiated"

echo "Starting WebUI API"
python -u webui.py --skip-python-version-check --skip-torch-cuda-test --skip-install --lowram --opt-sdp-attention --disable-safe-unpickle --port 7860 --api --nowebui --skip-version-check  --no-hashing &

# python  -u launch.py --api --listen

echo "Starting RunPod Handler"
python -u rp_handler.py
