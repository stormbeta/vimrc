#!/usr/bin/bash

# TODO: there has got to be a better way to handle this...

extensions=(
  heptio.jsonnet
  mauve.terraform
  tsandall.opa
  vscodevim.vim
  redhat.vscode-yaml
  ms-kubernetes-tools.vscode-kubernetes-tools
  ms-python.python
)

for ext in ${extensions[*]}; do
  code --install-extension "$ext"
done
