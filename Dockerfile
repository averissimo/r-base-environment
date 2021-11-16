ARG VERSION=latest

FROM rocker/tidyverse:$VERSION

ARG BIOC_VERSION=latest

RUN Rscript -e "install.packages(c('remotes', 'BiocManager'))" && \
  Rscript -e "if ('$BIOC_VERSION' == 'latest') { BiocManager::install() } else { BiocManager::install(version='$BIOC_VERSION') }" #&& \
#  Rscript -e "BiocManager::install('glmnet')" && \
#  Rscript -e "BiocManager::install(c('glmSparseNet'))" && \
#  echo "all done!"


