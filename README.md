Nim Docker image
================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[Nim programming language](http://nim-lang.org).

Total size of this image is only:

[![](https://badge.imagelayers.io/frolvlad/alpine-nim:latest.svg)](https://imagelayers.io/?images=frolvlad/alpine-nim:latest 'Get your own badge on imagelayers.io')


Usage Example
-------------

```bash
$ docker run --rm frolvlad/alpine-nim sh -c "echo 'echo("'"Hello World"'")' | nim compile --run -"
```

Once you have run this command you will get printed 'Hello World' from Nim!

NOTE: `nimble` is also available in this image.
