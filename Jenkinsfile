pipeline {
    agent any
    stages {
        stage('Git') {
            steps {
                echo 'Checking out code from Git.'
		checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'SSH_Github_Azure', url: 'git@github.com:ChocTitans/Java-Maven-JenkinsPipeline.git']]])	
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'mvn clean install'
            }
        }
        stage('Setup Environment - Ansible') {
            steps {
                echo 'Setuping....'
                ansiblePlaybook credentialsId: 'ansible_ssh', disableHostKeyChecking: true, installation: 'AnsibleAzure', inventory: 'hosts.cfg', playbook: 'Ansible-playbook.yml'
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
                sh 'docker build -t eltitans/pipelinejk:latest .'
                    withDockerRegistry([ credentialsId: "DockerHamza", url: "" ]) {
                    sh "docker push eltitans/pipelinejk:latest"
               }
            }
        }
    }
}
