FROM openjdk:17-jdk-slim-buster

WORKDIR /app
COPY ./target/products-0.0.1-SNAPSHOT.jar /app

EXPOSE 8080

CMD ["java", "-jar", "-Dspring.datasource.url=${datasource}", "products-0.0.1-SNAPSHOT.jar"]