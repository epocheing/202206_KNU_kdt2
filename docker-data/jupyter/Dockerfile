# set base image
FROM jupyter/datascience-notebook

# maintainer: SsongIU
MAINTAINER SsongIU

# hangul fonts setting
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdebi-core \
    locales \
    language-pack-ko \
    curl \
    fontconfig \
    fonts-nanum \
    fonts-naver-d2coding \
    && fc-cache -fv \
    && rm -fr ~/.cache/matplotlib \
    && rm -rf /var/lib/apt/lists/*

# locale setting
ENV LANG=ko_KR.UTF-8 \
    LANGUAGE=ko_KR.UTF-8 \
    LC_ALL=ko_KR.UTF-8 \
    PYTHONIOENCODING=utf-8

# install Quarto
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb \
    && gdebi -n quarto-linux-amd64.deb \
    && rm -rf quarto-linux-amd64.deb

# install requirments
USER ${NB_UID}
WORKDIR "${HOME}"
COPY requirements.txt .
COPY requirements-mamba.txt .
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && mamba install --yes --file requirements-mamba.txt \
    && conda install -c nclibz r-vscdebugger \
    && mamba clean --all -f -y \
    && rm -rf requirements.txt requirements-mamba.txt
