# alarmdecoder-docker
Docker Container files for AlarmDecoder app

`docker build -t amaurer/alarmdecoder:0.2 .`
`docker run -v /var/run/commbus/:/var/run/commbus/ -v /opt/alarmdecoder-settings/:/opt/alarmdecoder-settings/ --privileged --name alarmdecoder -d --restart=always amaurer/alarmdecoder:0.2`