# This is a full TexLive 2020 installation
# without any attempts to optimize space

FROM ubuntu:latest

# At least wget and make are needed

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget make git
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /opt

# Get and unpack TexLive installer

RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xf install-tl-unx.tar.gz
RUN rm install-tl-unx.tar.gz

# Rename installer directory to known name

RUN mv $(echo install-tl-*) install-tl-unx

WORKDIR /opt/install-tl-unx

# The TexLive profile is from an earlier interactive installation

COPY texlive.profile .

# Install TexLive

RUN perl install-tl --profile=texlive.profile

# Path to TexLive binaries as reported by installer

ENV PATH=$PATH:/usr/local/texlive/2020/bin/x86_64-linux

WORKDIR /opt

# Remove installer

RUN rm -rf install-tl-unx

# Create home directory

RUN mkdir home

WORKDIR /opt/home

CMD /bin/bash