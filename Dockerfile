FROM frolvlad/alpine-gcc

ENV PATH=$PATH:/opt/Nim/bin:/root/.nimble/bin

RUN apk add --update curl git perl && \
	mkdir -p /opt && \
	cd /opt && git clone "https://github.com/nim-lang/Nim.git" && \
	cd Nim && sh bootstrap.sh && \
	cd /opt && git clone "https://github.com/nim-lang/nimble.git" && \
	cd nimble && nim c -r src/nimble install && \
	rm -rf "/opt/Nim/csources" "/opt/Nim/tests" "/opt/nimble" && \
    apk del curl git perl && \
	rm -rf /var/cache/apk/*
