FROM openjdk:8

ADD target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.war spring-petclinic-2.2.0.BUILD-SNAPSHOT.war
EXPOSE 8088

ENTRYPOINT ["java", "-jar", "/spring-petclinic-2.2.0.BUILD-SNAPSHOT.war"]
