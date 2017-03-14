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

RUN pip install alarmdecoder twilio PyYAML pyusb watchdog pyserial

ADD https://github.com/amaurer/alarmdecoder/archive/master.zip /tmp/alarmdecoder.zip
RUN mkdir /var/run/commbus/ && \
	unzip /tmp/alarmdecoder.zip -d /opt/ && \
	mkdir /opt/alarmdecoder-settings/ && \
	touch /opt/alarmdecoder-settings/settings.yml && \
	ln -s /opt/alarmdecoder-settings/settings.yml /opt/alarmdecoder-master/settings.yml

WORKDIR /opt/alarmdecoder-master/
CMD ["./alarm.py"]