#!/bin/bash

#Update/Install vim vundle plugins

action="${1:-update}"
if [[ "${action}" == 'install' ]]; then
  vundle_cmd='BundleInstall'
else
  vundle_cmd='BundleUpdate'
fi

vim -s <(echo -e ":${vundle_cmd}\n:qa!\n")
