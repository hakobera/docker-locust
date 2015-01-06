FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y build-essential libncursesw5-dev libreadline-dev libssl-dev libgdbm-dev libc6-dev libsqlite3-dev libxml2-dev libxslt-dev python python-dev python-setuptools git
RUN apt-get clean
RUN easy_install -U pip
RUN pip install locustio pyzmq

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh

EXPOSE 8089
EXPOSE 5557
EXPOSE 5558

CMD ["/usr/local/bin/run.sh"]
