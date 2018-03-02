#! /bin/bash
set -e

(cd test/image; dgoss run danielspeixoto/jenkins:$1)