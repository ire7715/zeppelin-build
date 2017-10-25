FROM centos:centos7

RUN yum clean all && \
    yum install -y wget curl-devel expat-devel gettext-devel openssl-devel \
    zlib-devel gcc perl-ExtUtils-MakeMaker git bzip2 bzip2-libs

RUN yum install -y java-1.8.0-openjdk-devel.x86_64 && \
    mkdir /usr/java && \
    ln -s $(dirname $(dirname $(readlink -f /usr/bin/java))) /usr/java/default && \
    rm -f /usr/bin/java && ln -s /usr/java/default/bin/java /usr/bin/java

ENV JAVA_HOME /usr/java/default

RUN mkdir -p /usr/local/zeppelin/prerequisites/ && \
    cd /usr/local/zeppelin/prerequisites/ && \
    wget http://apache.stu.edu.tw/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz && \
    tar -xf apache-maven-3.5.0-bin.tar.gz  && \
    cd apache-maven-3.5.0 && \
    ln -s /usr/local/zeppelin/prerequisites/apache-maven-3.5.0/bin/mvn /usr/bin/mvn

COPY bootstrap.sh /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
