FROM maven:3.8.3-jdk-11 AS build
WORKDIR /hello_world

COPY ./ ./

RUN mvn clean package

FROM openjdk:11.0.7-jdk-slim

COPY --from=build /hello_world/target/hello_world-*.jar /hello_world.jar

CMD ["java", "-jar", "hello_world.jar"]
