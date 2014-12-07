#!/bin/bash
bundle exec middleman build
pushd dist
tar acf ../dist.tar.gz *
popd
