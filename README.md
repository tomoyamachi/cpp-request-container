# C++ Requests

Based on [cpr-example](https://github.com/whoshuu/cpr-example)

```
$ git submodule update --init --recursive
$ docker-compose up -d
```

Then make a build directory and do a typical CMake build from there:

```
$ docker-compose exec app bash

// attach in the container
mkdir build && cd build
cmake ..
cmake --build .
```