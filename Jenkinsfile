// pipeline {
//     agent none
//     stages {
//         stage('Build') {
//             agent { docker 'maven:3.6.3-jdk-11' }
//             steps {
//                 echo 'Hello, Maven'
//                 sh 'mvn -B -DskipTests clean package'
//             }
//         }
//         stage('Run') {
//             agent { docker 'openjdk:11.0.7-jdk-slim' }
//             steps {
//                 echo 'Hello, JDK'
//                 sh 'java -jar target/hello_world-0.0.1-SNAPSHOT.jar'
//             }
//         }
//     }
// }

pipeline{
	agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
	stages {
		stage('Build') {

			steps {
				sh 'docker build -t victoriagurkova/hello_world:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push victoriagurkova/hello_world:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}