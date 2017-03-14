# alarmdecoder-docker
Docker Container files for AlarmDecoder app


`docker run -v /var/run/commbus/:/var/run/commbus/ -v /opt/alarmdecoder-settings/:/opt/settings/ --privileged --name alarmdecoder -d --restart=always amaurer/alarmdecoder:0.1`