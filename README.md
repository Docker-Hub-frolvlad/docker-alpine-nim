[![Docker Stars](https://img.shields.io/docker/stars/frolvlad/alpine-nim.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-nim/)
[![Docker Pulls](https://img.shields.io/docker/pulls/frolvlad/alpine-nim.svg?style=flat-square)](https://hub.docker.com/r/frolvlad/alpine-nim/)


Nim Docker image
================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[Nim programming language](http://nim-lang.org).

Download size of this image is only:

[![](https://images.microbadger.com/badges/image/frolvlad/alpine-nim.svg)](http://microbadger.com/images/frolvlad/alpine-nim "Get your own image badge on microbadger.com")


Usage Example
-------------

```bash
$ docker run --rm frolvlad/alpine-nim sh -c "echo 'echo("'"Hello World"'")' | nim compile --run -"
```

Once you have run this command you will get printed 'Hello World' from Nim!

NOTE: `nimble` is also available in this image.
