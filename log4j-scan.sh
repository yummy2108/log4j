#! /usr/bin/env bash

# cause errors to terminate as opposed to continute
# cause errors in variable assignment to terminate as opposed to continute
# cause errors in pipelines to terminate as opposed to continute
# set -euo pipefail


# docker
# docker might not be installed, so check for it first
# supply `--no-trunc` so that we get the whole commandline for launching the container
echo "--------and docker too--------"
if [ "$(which docker)" ]; then docker ps --no-trunc | grep "java\|jdk"; fi


# ps
# Just dumping this to stdout if we find it
echo "--------ps-ing--------"
ps -ef | grep -i 'java\|jdk' | grep -v grep


# find
# Just dumping this to stdout if we find it, then bailing out
# according to the POSIX standard, the default behavior of `find` is to not follow symlinks (also -P)
#   https://linux.die.net/man/1/find
echo "--------finding--------"
find /usr -name '*log4j*' | grep "jar\|properties"
find /bin -name '*log4j*'  | grep "jar\|properties"
find /var/lib -name '*log4j*'  | grep "jar\|properties"
find /opt -name '*log4j*'  | grep "jar\|properties"


# which
# Just dumping this to stdout if we find it, then bailing out
# debian which only allows the short `-a` version
echo "--------Which-ing--------"
which -a java


# explicitly exit cleanly
exit 0