FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y ansible ssh sudo curl && \
    apt clean

COPY . /ansible
WORKDIR /ansible

CMD ["ansible-playbook", "-i", "inventory", "playbook.yml"]
