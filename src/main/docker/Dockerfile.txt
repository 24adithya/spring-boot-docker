FROM dockerfile/java:oracle-java8

VOLUME /tmp
ADD SpringDocker.jar /opt/SpringDocker/
EXPOSE 8080
WORKDIR /opt/SpringDocker/
CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-Xms512m", "-Xmx1g", "-jar", "SpringDocker.jar"]
