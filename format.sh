#!/usr/bin/env bash

find site/ -type f -name "*.html" -exec tidy -file {}-error.txt -modify -utf8 -indent --clean yes --doctype html5 {} \;