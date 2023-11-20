FROM ubuntu

EXPOSE 80
EXPOSE 22

WORKDIR $HOME 

RUN apt update -y -q && \
apt install -y -q git && \
apt install -y -q wget && \
apt install -y -q sudo && \
apt install -y -q curl && \
apt install -y -q vim && \
apt install -y -q jq && \
apt install -y -q lsof


COPY script.sh /usr/script.sh

COPY enter-systemd-namespace /root/wsl/enter-systemd-namespace
COPY start-systemd-namespace /root/wsl/start-systemd-namespace
COPY ubuntu-wsl2-systemd-script.sh /root/wsl/ubuntu-wsl2-systemd-script.sh

RUN chmod +X /usr/script.sh

RUN bash /root/wsl/ubuntu-wsl2-systemd-script.sh --force

ENTRYPOINT [ "/usr/script.sh" ]
