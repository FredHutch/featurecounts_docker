FROM r-base:3.6.2


# Install bioconductor
RUN apt-get update
RUN apt-get install -y aptitude
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libssl-dev
RUN R -q -e 'install.packages("BiocManager", repos="https://cran.r-project.org")'
RUN R -e 'BiocManager::install(c("GenomicRanges","GenomeInfoDb","Rsamtools","GenomicAlignments","GenomicFeatures","dplyr","rtracklayer", "Rsubread"), ask=FALSE)'

# Cleanup
RUN apt-get clean

