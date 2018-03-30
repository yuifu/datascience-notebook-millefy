FROM jupyter/datascience-notebook:c88678a1c7c9

USER root

RUN ln -s /bin/tar /bin/gtar

USER $NB_UID

# Install Biocondoctor
RUN R -e 'source("https://bioconductor.org/biocLite.R"); biocLite()'

# Install data.table and dtplyr
RUN R -e 'install.packages(c("data.table", "dtplyr"), dependencies=TRUE, repos="https://cran.rstudio.com/")'

RUN R -e 'install.packages(c("proxy"), dependencies=TRUE, repos="https://cran.ism.ac.jp/")'

RUN Rscript -e "source(\"https://bioconductor.org/biocLite.R\"); biocLite(c('Rsamtools', 'GenomicRanges',  'rtracklayer'))"

RUN Rscript -e "install.packages('viridisLite', dependencies=TRUE, repos='https://cran.ism.ac.jp/'); source(\"https://bioconductor.org/biocLite.R\"); biocLite(c('destiny'))"

RUN Rscript -e "options(unzip = 'internal'); devtools::install_github(\"yuifu/millefy\")"

