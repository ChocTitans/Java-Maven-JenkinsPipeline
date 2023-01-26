pipeline {
    agent any
    stages {
        stage('Git') {
            steps {
                echo 'Checking out code from Git.'
                git url: 'https://github.com/ChocTitans/Java-Maven-JenkinsPipeline.git'
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
                sh 'mvn test'
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
                sh 'docker build -t mavenpipeline:$BUILD_NUMBER .'
                sh 'docker push mavenpipeline:$BUILD_NUMBER'
            }
        }
    }
}
