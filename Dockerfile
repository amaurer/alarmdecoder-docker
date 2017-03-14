# FROM resin/rpi-raspbian:wheezy-20170309
FROM sdhibit/rpi-raspbian

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get clean

RUN apt-get install -y \
    unzip \
    python \
    python-dev \
    python-pip \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/amaurer/alarmdecoder/archive/master.zip /tmp/alarmdecoder.zip
RUN mkdir /var/run/commbus/ && \
	mkdir /opt/settings/ && \
	mkdir /opt/alarmdecoder/ && \
	unzip /tmp/alarmdecoder.zip -d /opt/ && \
	touch /opt/settings/settings.yml

RUN pip install alarmdecoder twilio


WORKDIR /opt/alarmdecoder-master/
CMD ["alarm.py"]