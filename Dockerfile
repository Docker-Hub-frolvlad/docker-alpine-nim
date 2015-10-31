FROM frolvlad/alpine-gcc

RUN apk add --update openssl && \
    mkdir -p "/opt" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/Nim/archive/master.zip" && \
    unzip "master.zip" && \
    rm "master.zip" && \
    mv "Nim-master" "Nim" && \
    cd "Nim" && \
    wget "https://github.com/nim-lang/csources/archive/devel.zip" && \
    unzip "devel.zip" && \
    rm -rf "devel.zip" && \
    mv "csources-devel" "csources" && \
    touch "csources/.git" && \
    sh bootstrap.sh && \
    chmod 755 "/opt/Nim/bin/nim" && \
    ln -s "/opt/Nim/bin/nim" "/usr/local/bin/nim" && \
    rm -rf "/opt/Nim/csources" "/opt/Nim/tests" && \
    \
    cd "/opt" && \
    wget "https://github.com/nim-lang/nimble/archive/master.zip" && \
    unzip "master.zip" && \
    rm "master.zip" && \
    cd "nimble-master" && \
    nim compile --run "src/nimble" build && \
    mv nimble "/usr/local/bin/" && \
    rm -rf "/opt/nimble-master" && \
    \
    apk del openssl && \
    rm -rf "/var/cache/apk/"*
