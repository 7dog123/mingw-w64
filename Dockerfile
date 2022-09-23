FROM ubuntu:latest

COPY ./sources.list /etc/apt

COPY apt-get update && \
     apt-get -y build-dep binutils-mingw-w64-x86-64 \
     gcc-mingw-w64-x86-64 mingw-w64-x86-64-dev \
     win-iconv-mingw-w64-dev libnpth-mingw-w64-dev \
     libgcrypt-mingw-w64-dev gdb-mingw-w64-target \
     mingw-w64

RUN apt-get -y source --compile binutils-mingw-w64-x86-64 \
     gcc-mingw-w64-x86-64 mingw-w64-x86-64-dev \
     win-iconv-mingw-w64-dev libnpth-mingw-w64-dev \
     libgcrypt-mingw-w64-dev gdb-mingw-w64-target \
     mingw-w64

