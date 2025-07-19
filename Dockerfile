# Default use the NVIDIA official image with PyTorch 2.3.0
# https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/index.html
ARG BASE_IMAGE=nvcr.io/nvidia/pytorch:24.02-py3
FROM ${BASE_IMAGE}

RUN git clone https://github.com/llm-on-gke/torchtitan
WORKDIR torchtitan
RUN pip install -r requirements.txt

RUN python scripts/download_tokenizer.py --repo_id deepseek-ai/DeepSeek-V3 



