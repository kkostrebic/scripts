#!/bin/bash

if [[ $BLOCK_BUTTON -eq 1 ]]; then
  printf '{"full_text":"", "color":"#555555", "_counter":"0"}\n'
else
  ft="|"
  printf '{"full_text":$ft, "color":"#00FFFF"}\n'
fi
exit 0
