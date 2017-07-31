# docker-locust

Docker base image for locust master/slave/standalone.

## How to use

This is a base image of locust. So you have to build your own docker image from this image like this.

```
FROM hakobera/locust

ADD ./test /test
ENV SCENARIO_FILE /test/locustfile.py
```

Then build it and run.

```
$ docker build -t locust-test .
```

### standalone

```
$ docker run -e LOCUST_MODE=standalone -e TARGET_URL=http://127.0.0.1 locust-test
```

### distribution

#### master

```
$ docker run \
  -e LOCUST_MODE=master \
  -e TARGET_URL=http://<your-target-server> \
  locust-test
```

#### slave

```
$ docker run \
  -e LOCUST_MODE=slave \
  -e MASTER_HOST=<master-server-ip> \
  -e TARGET_URL=https://<your-target-server> \
  locust-test
```
