pipeline {
    agent any
    stages {
        stage('Git') {
            steps {
                echo 'Checking out code from Git.'
				checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'githubid', url: 'https://github.com/ChocTitans/Java-Maven-JenkinsPipeline.git']]])	
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                bat 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                bat 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                bat 'mvn deploy'
            }
        }
        stage('Docker Push') {
            steps {
                echo 'Pushing Docker image...'
                bat 'docker build -t ${NAME} .'
                bat 'docker push ${NAME}'
            }
        }
    }
}
