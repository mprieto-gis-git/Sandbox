FROM ubuntu:24.04
ENV TZ=Pacific/Sydney

# Bootstrap packages needed to add a PPA
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tzdata \
        gnupg \
        ca-certificates \
        software-properties-common \
        dirmngr \
        wget \
        curl && \
    echo "Pacific/Sydney" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata


# System packages (gdal-bin/libgdal-dev now resolve from the PPA)
RUN apt-get install -y --no-install-recommends \
        libssl-dev \
        libssh2-1-dev \
        libcurl4-openssl-dev \
        libxml2-dev \
        python3-pip \
        gdal-bin \
        libgdal-dev \
        python3-geopandas \
        jq && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Python packages
RUN pip3 install --break-system-packages \
        boto3 \
        s3fs \
        sqlalchemy

RUN pip3 install awscli --break-system-packages
RUN pip3 install openpyxl --break-system-packages
RUN apt update && \
    apt install -y --no-install-recommends make