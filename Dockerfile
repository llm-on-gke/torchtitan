# Default use the NVIDIA official image with PyTorch 2.3.0
# https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/index.html
# BASE_IMAGE=nvcr.io/nvidia/pytorch:24.02-py3
# https://github.com/orgs/pytorch/packages/container/pytorch-nightly/versions
ARG BASE_IMAGE=ghcr.io/pytorch/pytorch-nightly:2.9.0.dev20250720-cuda12.6-cudnn9-devel
FROM ${BASE_IMAGE}
RUN apt-get -y update && apt-get -y install git
RUN git clone https://github.com/llm-on-gke/torchtitan
WORKDIR torchtitan
RUN pip install -r requirements.txt
RUN pip install -e .
#RUN pip install tyro
RUN python scripts/download_tokenizer.py --repo_id deepseek-ai/DeepSeek-V3 



