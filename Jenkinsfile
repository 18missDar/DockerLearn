pipeline{
	agent any
	environment {
// 	получпаем реквизиты для входа
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