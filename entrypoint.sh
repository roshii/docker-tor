#!/bin/sh
set -e

chown -R $USER $HOME
exec gosu $USER "$@"
