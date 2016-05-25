#!/bin/bash

#Update/Install vim vundle plugins

action="${1:-update}"
if [[ "${action}" == 'install' ]]; then
  plug_cmd='PlugInstall'
else
  plug_cmd='PlugUpgrade'
fi

vim -e -c "${plug_cmd}" -c 'qa!'
