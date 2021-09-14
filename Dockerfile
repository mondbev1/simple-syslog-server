FROM maven:3.6.3-jdk-11-slim AS build
MAINTAINER Shai Kuzi <somemail@gmail.com>

WORKDIR usr/src/simple-syslog-server
COPY . ./
RUN mvn clean package

# Package stage

FROM gcr.io/distroless/java:8
ARG JAR_NAME="simple-syslog-server"
WORKDIR /usr/src/simple-syslog-server
COPY --from=build /usr/src/simple-syslog-server/target/simple-syslog-server.jar ./simple-syslog-server.jar
ENTRYPOINT ["java", "-jar", "./simple-syslog-server.jar"]
EXPOSE 9898
CMD ["udp"]
