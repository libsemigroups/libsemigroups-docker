This repository contains the source for the [libsemigroups](https://hub.docker.com/repository/docker/libsemigroups/libsemigroups) Docker container.

If you have [Docker](https://www.docker.com) installed, you can download this container using:
~~~
docker pull libsemigroups/libsemigroups-docker
~~~
and run it by doing
~~~
docker run --rm -it libsemigroups/libsemigroups-docker
~~~

If you want to use a specific version of `libsemigroups`, then use:
~~~
docker pull libsemigroups/libsemigroups-docker:version-1.0.9
docker run --rm -it libsemigroups/libsemigroups-docker:version-1.0.9
~~~
or, for the latest version, use:
~~~
docker pull libsemigroups/libsemigroups-docker:latest
docker run --rm -it libsemigroups/libsemigroups-docker:latest
~~~

This container is used by the [libsemigroups-cppyy](https://hub.docker.com/repository/docker/libsemigroups/libsemigroups-cppyy) Docker container.

