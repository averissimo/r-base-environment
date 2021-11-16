ARG VERSION=latest

FROM rocker/tidyverse:$VERSION

ARG BIOC_VERSION=devel

RUN Rscript -e "install.packages(c('remotes', 'BiocManager'))" && \
  # Rscript -e "install.packages(c(''))" && \ # template
  Rscript -e "BiocManager::install(version='$BIOC_VERSION')" && \
  Rscript -e "BiocManager::install('glmnet')" && \
  echo "all done!"
  #Rscript -e "BiocManager::install(c('glmSparseNet'))" && \


