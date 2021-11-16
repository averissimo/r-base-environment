ARG VERSION=latest

FROM rocker/tidyverse:$VERSION

ARG BIOC_VERSION=latest

RUN echo $(whoami)

RUN Rscript -e "install.packages(c('remotes', 'BiocManager'))" && \
  Rscript -e "if ('$BIOC_VERSION' == 'latest') { BiocManager::install() } else { BiocManager::install(version='$BIOC_VERSION') }" && \
  Rscript -e "BiocManager::install('glmnet')"

COPY scripts/ /my-scripts

RUN apt-get update && apt install -y curl && \
  wget https://github.com/sysbiomed/glmSparseNet/archive/refs/heads/master.zip && \
  unzip master.zip && \
  cd glmSparseNet-master && \
  bash /my-scripts/install_deps.sh && \
  cd .. && rm glmSparseNet-master && \
  rm -rf /var/lib/apt/lists/*

RUN Rscript -e "BiocManager::install(c('glmSparseNet'))"
