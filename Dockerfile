FROM ubuntu:lunar

USER root
WORKDIR /app
ENV USER root
ENV ASDF_DIR /root/.asdf

RUN apt-get update -y && apt-get install -y vim

COPY . ./

RUN sed -i "s/sudo //g" install.sh
RUN sed -i "s/sudo //g" ./asdf/os-basics.sh
RUN sed -i "s/sudo //g" ./asdf/asdf-install.sh
RUN sed -i "s/  install_snaps/  # install_snaps/g" ./install.sh
RUN sed -i "s/  sh -c \".\/ohmyzsh.sh\"/  # sh -c \".\/ohmyzsh.sh\"/g" install.sh
RUN sed -i "s/  touch \/tmp\/asdf\-java.cache\/sapmachine.json//g" ./asdf/asdf-install.sh

ENTRYPOINT ["./install.sh"]
