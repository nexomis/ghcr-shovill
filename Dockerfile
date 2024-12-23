FROM mambaorg/micromamba:2.0.5-alpine3.20

LABEL org.opencontainers.image.title="Docker image for shovill"
LABEL org.opencontainers.image.authors="Julien FOURET"
LABEL org.opencontainers.image.description="Based on micromamba/alpine and bioconda channel. https://github.com/tseemann/shovill"
LABEL org.opencontainers.image.vendor="Nexomis"
LABEL org.opencontainers.image.licenses="Apache-2.0 AND GPL-3.0-or-later AND MIT/Expat AND Zlib GPL-2.0-or-later AND NCBI-PD AND PSF"

# Licenses
# --------
# shovill: GPL-3.0-or-later
# spades: GPL-2.0-or-later
# skesa: NCBI-PD
# velvet: GPL-3.0-or-later
# megahit: GPL-3.0-or-later
# lighter: GPL-3.0-or-later
# flash: GPL-3.0-or-later
# samtools: MIT/Expat
# bwa: GPL-3.0-or-later
# KMC: GPL-3.0-or-later
# seqtk: MIT
# pigz: Zlib
# pilon: GPL-2.0-or-later
# trimmomatic: GPL-3.0-or-later
# samclip: GPL-3.0-or-later
# alpine: MIT
# micromamba: BSD-3-Clause
# python: PSF

RUN micromamba install -y -n base -c conda-forge -c bioconda \
  shovill=1.1.0 \
  && sed -i 's/re\.split("(\\d+)"/re.split("(\\\\d+)"/g' /opt/conda/share/spades/spades_pipeline/support.py \
  && micromamba clean --all --yes


