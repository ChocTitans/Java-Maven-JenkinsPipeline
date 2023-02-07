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
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sg 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'mvn deploy'
            }
        }
        stage('Docker Push') {
            steps {
                echo 'Pushing Docker image...'
                sh 'docker build -t eltitans/pipelinejk:latest .'
                    withDockerRegistry([ credentialsId: "docker-hub", url: "" ]) {
                    bat "docker push eltitans/pipelinejk:latest"
                    }
            }
        }
    }
}
