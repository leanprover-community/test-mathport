FROM ubuntu

USER root

# Set timezone to UTC to avoid prompts from tzdata.
RUN TZ=UTC ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install prerequisites.
RUN apt-get update && \
    # Lean4 prerequisites:
    apt-get install -y git libgmp-dev cmake ccache gcc-10 g++-10 && \
    apt-get clean
# We need curl to download elan
RUN apt-get install -y curl
# Lake additionally requires some header files for the compiler:
RUN apt-get install -y build-essential

# create a non-root user
RUN useradd -m lean

USER lean
WORKDIR /home/lean

SHELL ["/bin/bash", "-c"]
# set the entrypoint to be a login shell, so everything is on the PATH
ENTRYPOINT ["/bin/bash", "-l"]

# make sure binaries are available even in non-login shells
ENV PATH="/home/lean/.elan/bin:/home/lean/.local/bin:$PATH"

# install elan
RUN curl https://raw.githubusercontent.com/Kha/elan/master/elan-init.sh -sSf | sh -s -- -y && \
    . ~/.profile && \
    elan toolchain uninstall stable

RUN git clone https://github.com/leanprover/lake && \
    cd lake && \
    ./build.sh

ENV PATH="/home/lean/lake/build/bin/:$PATH"

# Clone the `test-mathport` repository.
RUN git clone https://github.com/leanprover-community/test-mathport
WORKDIR /home/lean/test-mathport

RUN make download-release

## To test:

# docker build -t test-mathport .
# docker run -it test-mathport
# lake build

## (Once we can get that to work, I will add `lake build` to the Dockerfile.)