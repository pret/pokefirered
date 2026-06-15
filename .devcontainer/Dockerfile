# See here for image contents: https://github.com/devcontainers/images/blob/main/src/base-ubuntu/.devcontainer/Dockerfile

# [Choice] Ubuntu version: jammy, noble. Noble is set as the default, with the argument editable in devcontainer.json.
ARG VARIANT="noble"
FROM mcr.microsoft.com/devcontainers/base:2-${VARIANT}

# Install necessary packages for building pokefirered
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get -y install --no-install-recommends \
 binutils-arm-none-eabi \
 build-essential \
 git \
 libpng-dev \
 gcc-arm-none-eabi \
 libnewlib-arm-none-eabi \
 gdb-multiarch

# Download and compile agbcc
WORKDIR /tmp/tools/agbcc
RUN git clone https://github.com/pret/agbcc . && ./build.sh