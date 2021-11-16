#!/bin/bash


while read -r cmd
do
  eval $cmd
done < <(Rscript -e 'writeLines(remotes::system_requirements("ubuntu", "20.04"))')
