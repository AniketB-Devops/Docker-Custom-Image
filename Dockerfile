# Use Amazon Linux 2 or Amazon Linux 3 as base image
FROM amazonlinux:2

# Install OpenJDK 11 (Amazon Linux uses 'yum' package manager, so it's similar to CentOS)
RUN yum install -y java-17-amazon-corretto-devel.x86_64 tar
# Create and set up Tomcat
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat

# Download Apache Tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.tar.gz .

# Extract Tomcat
RUN tar -xvzf apache-tomcat-9.0.102.tar.gz

# Move Tomcat to the correct directory
RUN mv apache-tomcat-9.0.102 tomcat

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tomcat/tomcat/bin/catalina.sh", "run"]
