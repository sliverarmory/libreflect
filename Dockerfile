FROM alpine:3.17.0

RUN apk update && apk --no-cache add gcc g++ libc-dev cmake make

ADD . /libreflect
WORKDIR /libreflect
# Configure CMake
RUN cmake -B build
# build
RUN cmake --build build