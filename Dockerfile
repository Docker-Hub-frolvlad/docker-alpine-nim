FROM frolvlad/alpine-gcc

RUN export NIM_VERSION=0.12.0 && \
    export NIMBLE_VERSION=0.6.4 && \
    \
    apk add --no-cache --virtual=build-dependencies ca-certificates && \
    mkdir -p "/opt" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/Nim/archive/v$NIM_VERSION.tar.gz" -O - | tar xz && \
    mv "Nim-$NIM_VERSION" "Nim" && \
    cd "Nim" && \
    wget "https://github.com/nim-lang/csources/archive/master.tar.gz" -O - | tar xz && \
    mv "csources-master" "csources" && \
    touch "csources/.git" && \
    sh bootstrap.sh && \
    ln -s "/opt/Nim/bin/nim" "/usr/local/bin/nim" && \
    rm -rf "./csources" "./tests" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/nimble/archive/v$NIMBLE_VERSION.tar.gz" -O - | tar xz && \
    cd "nimble-$NIMBLE_VERSION" && \
    nim compile --run "src/nimble" build && \
    mv nimble "/usr/local/bin/" && \
    rm -rf "/opt/nimble-$NIMBLE_VERSION" && \
    \
    apk del build-dependencies
