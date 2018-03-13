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

### Standalone

```
$ docker run -e LOCUST_MODE=standalone -e TARGET_URL=http://127.0.0.1 locust-test
```

### Distribution

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
  -e MASTER_HOST=http://<master-server-ip> \
  -e TARGET_URL=https://<your-target-server> \
  locust-test
```

### Alternative to building your own image

An alternative to building your own image is to share your script into a temporary container. Assuming you have a `locustfile.py` file in the current folder you're in, you can run standalone with this command:

```
docker run --rm -v `pwd`:/myloadtest -p 8089:8089 hakobera/locust locust -f /myloadtest/locustfile.py --host http://mysite
```

You will also be able to access the web interface at http://localhost:8089
