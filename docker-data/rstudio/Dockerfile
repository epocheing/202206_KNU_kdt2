# set base image
FROM rocker/geospatial

# maintainer: SsongIU
MAINTAINER SsongIU

# locale setting
ENV LANG=ko_KR.UTF-8 \
    LANGUAGE=ko_KR.UTF-8 \
    LC_ALL=ko_KR.UTF-8 \
    PYTHONIOENCODING=utf-8

# hangul fonts setting
RUN apt-get update && apt-get install -y --no-install-recommends \
    fontconfig \
    fonts-nanum \
    fonts-naver-d2coding \
    && fc-cache -fv \
    && rm -rf /var/lib/apt/lists/*
