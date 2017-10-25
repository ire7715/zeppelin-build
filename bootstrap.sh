#!/bin/bash

cd /usr/local/zeppelin/
git clone https://github.com/apache/incubator-zeppelin.git
cd /usr/local/zeppelin/incubator-zeppelin
sed -i 's/bower install --silent/bower install --silent --allow-root/' /usr/local/zeppelin/incubator-zeppelin/zeppelin-web/package.json
mvn clean package -Pspark-2.2 -Dspark.version=2.2.0 -Dhadoop.version=2.7.1 -Phadoop-2.7 -Pyarn -DskipTests

cd /usr/local/zeppelin/
tar -czf zeppelin-h2.7.1-s2.2.0.tar incubator-zeppelin

/bin/bash