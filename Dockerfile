FROM frolvlad/alpine-gcc

RUN export NIM_VERSION=0.15.2 && \
    export NIMBLE_VERSION=0.7.10 && \
    \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates git && \
    mkdir -p "/opt" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/Nim/archive/v$NIM_VERSION.tar.gz" -O - | tar xz && \
    mv "./Nim-$NIM_VERSION" "./Nim" && \
    cd "./Nim" && \
    wget "https://github.com/nim-lang/csources/archive/master.tar.gz" -O - | tar xz && \
    mv "./csources-master" "./csources" && \
    cd "./csources" && \
    sh build.sh && \
    cd .. && \
    ./bin/nim c koch && \
    ./koch boot -d:release && \
    chmod +x "/opt/Nim/bin/nim" && \
    ln -s "/opt/Nim/bin/nim" "/usr/local/bin/nim" && \
    rm -r "./csources" "./tests" "./web" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/nimble/archive/v$NIMBLE_VERSION.tar.gz" -O - | tar xz && \
    cd "./nimble-$NIMBLE_VERSION" && \
    nim compile --run "src/nimble" build --accept && \
    rm -rf /tmp/* && \
    chmod +x nimble && \
    mv nimble "/usr/local/bin/" && \
    rm -rf "/opt/nimble-$NIMBLE_VERSION" && \
    \
    apk del .build-dependencies
