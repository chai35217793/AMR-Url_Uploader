FROM ubuntu:20.04

RUN mkdir ./app
WORKDIR ./app

RUN apt -qq update

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt -qq install -y git python3 ffmpeg python3-pip

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .

RUN chmod +x start.sh

CMD ["./start.sh"]
