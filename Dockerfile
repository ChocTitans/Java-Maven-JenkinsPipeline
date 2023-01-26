FROM openjdk:8
WORKDIR /work/

COPY target/*.jar /work/javajarjenkins.jar


EXPOSE 8080
CMD ["java","-jar","javajarjenkins.jar"]