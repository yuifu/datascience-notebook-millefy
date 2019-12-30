# https://github.com/jupyter/docker-stacks/blob/7a0c7325e470b6d9aea05d2baedfc690e858bcba/datascience-notebook/Dockerfile
FROM jupyter/datascience-notebook:7a0c7325e470

USER root

RUN ln -s /bin/tar /bin/gtar

RUN conda install -c r r-stringi

USER $NB_UID

RUN Rscript -e "install.packages('openxlsx', dependencies=TRUE, repos='https://cran.ism.ac.jp/')"

RUN R -e 'install.packages(c("data.table", "dtplyr"), dependencies=TRUE, repos="https://cran.rstudio.com/")'

RUN R -e 'install.packages(c("proxy"), dependencies=TRUE, repos="https://cran.ism.ac.jp/")'

RUN Rscript -e "install.packages('viridisLite', dependencies=TRUE, repos='https://cran.ism.ac.jp/')"

# Install Biocondoctor
RUN R -e 'install.packages("BiocManager", repos="https://cran.ism.ac.jp/"); BiocManager::install(version = "3.10")'

RUN Rscript -e 'BiocManager::install(c("Rsamtools", "GenomicRanges", "rtracklayer"))'

RUN Rscript -e "BiocManager::install('destiny')"

RUN Rscript -e "options(unzip = 'internal'); devtools::install_github(\"yuifu/millefy\", ref='v0.1.9')"

