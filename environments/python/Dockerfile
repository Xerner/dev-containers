FROM python:3.11-slim

RUN apt update --yes
RUN apt upgrade --yes
RUN apt install git --yes
RUN apt install less --yes

COPY copy/* /root
ENTRYPOINT ["tail", "-f", "/dev/null"]
