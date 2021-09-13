FROM gcr.io/distroless/java:8
MAINTAINER Shai Kuzi <somemail@gmail.com>

COPY target/simple-syslog-server.jar /simple-syslog-server.jar
ENTRYPOINT ["/usr/bin/java", "-jar", "/simple-syslog-server.jar"]
EXPOSE 9898
CMD ["tcp" ]