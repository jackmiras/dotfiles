FROM ubuntu:eoan

USER root
WORKDIR /app

RUN apt-get update && apt-get install -y vim

COPY . ./

RUN sed -i "s/sudo //g" install.sh
RUN sed -i "s/sudo //g" ./asdf/os-basics.sh
RUN sed -i "s/sudo //g" ./asdf/asdf-install.sh

ENTRYPOINT ["./install.sh"]
