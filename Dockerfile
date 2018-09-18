FROM ubuntu:18.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      build-essential \
      libncursesw5-dev \
      libreadline-dev \
      libssl-dev \
      libgdbm-dev \
      libc6-dev \
      libsqlite3-dev \
      libxml2-dev \
      libxslt-dev \
      python \
      python-dev \
      python-setuptools \
      python-pip \
    && apt-get clean
RUN pip install locustio pyzmq

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh

EXPOSE 8089 5557 5558

CMD ["/usr/local/bin/run.sh"]
