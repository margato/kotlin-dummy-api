FROM amazoncorretto:11-alpine-jdk
MAINTAINER github.com/margato
COPY target/dummy-api-1.0.0.jar dummy-api-1.0.0.jar
ENTRYPOINT ["java","-jar","/dummy-api-1.0.0.jar"]