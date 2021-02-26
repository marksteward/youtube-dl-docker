FROM python

RUN apt-get update && \
    apt-get -y install git ffmpeg && \
    git clone https://github.com/ytdl-org/youtube-dl && \
    cd youtube-dl && \
    python setup.py install && \
    mkdir /data

WORKDIR /data

ENTRYPOINT ["youtube-dl"]
