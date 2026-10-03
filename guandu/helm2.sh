#!/bin/bash

helm install openab openab/openab \
  --namespace guandu \
  --version 0.10.0-beta.5 \
  -f ./values.yaml

helm upgrade openab openab/openab \
  --namespace guandu \
  --version 0.10.0-beta.5 \
  -f ./values.yaml

helm uninstall openab --namespace guandu