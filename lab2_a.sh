#!/bin/bash
grep -r -i --include=\*.h 'magic' ../usr/src/kernels/3.10.0-1160.42.2.el7.x86_64 | wc -l