FROM maven:3.8.3-jdk-11 AS build
WORKDIR /hello_world

COPY ./ ./

RUN mvn clean package

FROM openjdk:11.0.7-jdk-slim

COPY --from=build /hello_world/target/hello_world-*.jar /hello_world.jar

CMD ["java", "-jar", "hello_world.jar"]

#pipeline {
#    agent none
#    stages {
#        stage('Build') {
#            agent { docker 'maven:3.6.3-jdk-11' }
#            steps {
#                echo 'Hello, Maven'
#                sh 'mvn -B -DskipTests clean package'
#            }
#        }
#        stage('Run') {
#            agent { docker 'openjdk:11.0.7-jdk-slim' }
#            steps {
#                echo 'Hello, JDK'
#                sh 'java -jar target/hello_world-0.0.1-SNAPSHOT.jar'
#            }
#        }
#    }
#}