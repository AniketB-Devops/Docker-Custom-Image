FROM amazonlinux:2

RUN yum install -y java-17-amazon-corretto-devel.x86_64 tar
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat

ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz .

RUN tar -xvzf apache-tomcat-9.0.102.tar.gz

RUN mv apache-tomcat-9.0.102 tomcat

EXPOSE 8080

CMD ["/opt/tomcat/tomcat/bin/catalina.sh", "run"]
