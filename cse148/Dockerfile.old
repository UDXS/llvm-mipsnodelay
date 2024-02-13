FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ARG TARGETPLATFORM

SHELL ["/bin/bash", "-c"]
RUN apt-get update -y && apt-get install -y build-essential gcc g++ binutils wget git ninja-build
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=linux-x86_64; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=linux-aarch64; else ARCHITECTURE=linux-x86_64; fi \
    && wget -O /tmp cmake.sh https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3-${ARCHITECTURE}.sh
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=linux-x64; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=linux-arm64; else ARCHITECTURE=linux-x64; fi \
    && wget --progress=bar:force:noscroll  -O /tmp/osscad.tar.gz "https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2024-02-13/oss-cad-suite-${ARCHITECTURE}-20240213.tgz" 
RUN tar  xzf "/tmp/osscad.tar.gz" -C / && rm -rf /tmp/osscad.tar.gz
RUN git clone --depth 1 --branch llvmorg-17.0.6 https://github.com/llvm/llvm-project.git
COPY branchdelays.patch /tmp
RUN cd llvm-project && git apply /tmp/branchdelays.patch
RUN cd llvm-project && mkdir build && \
cmake -S llvm -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/llvm -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="Mips" && \
cd build && cmake --build . && cmake --build . --target install && cd / && rm -rf llvm-project
