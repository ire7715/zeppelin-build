# Build Zeppelin
Since building a customized Zeppelin version could be very time-consuming. Why don't we make a Docker image to reduce the trail-and-error cost?

----
# Releases

# Build Custom Distribution
> Not found a distribution that satisfies your demand? Make your own one!
````
docker build -t zeppelin-build:${VERSION} .
docker run -it --name zeppelin-build zeppelin-build:${VERSION} /etc/bootstrap.sh
# Wait for the maven packaging done
docker cp zeppelin-build:${VERSION}:/usr/local/zeppelin/zeppelin-${VERSION}.tar ./
````

## Error occurred while `mvn package`
No worries. Just enter the container with the following command:
````
docker start zeppelin-build
docker exec -it zeppelin-build /bin/bash
````
Then you can fix the error(s) and continue the maven packaging without restart again.
