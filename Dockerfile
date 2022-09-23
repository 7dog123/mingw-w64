FROM ubuntu:latest

COPY ./sources.list /etc/apt

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Central

RUN apt update && \
     apt -y build-dep binutils-mingw-w64-x86-64 \
     gcc-mingw-w64-x86-64 mingw-w64-x86-64-dev \
     win-iconv-mingw-w64-dev libnpth-mingw-w64-dev \
     libgcrypt-mingw-w64-dev gdb-mingw-w64-target \
     mingw-w64 && \
     apt-get autoclean

WORKDIR /usr/src

RUN apt source --compile binutils-mingw-w64-x86-64 && \
     rm -rf * && \
     apt source --compile gcc-mingw-w64-x86-64  && \
     rm -rf * && \
     apt source --compile mingw-w64-x86-64-dev && \
     rm -rf * && \
     apt source --compile win-iconv-mingw-w64-dev && \
     rm -rf * && \
     apt source --compile libnpth-mingw-w64-dev && \
     rm -rf * && \
     apt source --compile libgcrypt-mingw-w64-dev && \
     rm -rf * && \
     apt source --compile gdb-mingw-w64-target && \
     rm -rf * && \
     apt source --compile mingw-w64 && \
     rm -rf *

