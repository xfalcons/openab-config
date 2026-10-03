#!/bin/bash

helm install openab openab/openab \
  --namespace guandu \
  --version 0.10.0-beta.5 \
  -f ./values.yaml \
  --set-file agents.caocao.configToml=./config-caocao.toml \
  --set-file agents.zhangliao.configToml=./config-zhangliao.toml

helm upgrade openab openab/openab \
  --namespace guandu \
  --version 0.10.0-beta.5 \
  -f ./values.yaml \
  --set-file agents.caocao.configToml=./config-caocao.toml \
  --set-file agents.zhangliao.configToml=./config-zhangliao.toml

helm uninstall openab --namespace guandu