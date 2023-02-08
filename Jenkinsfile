pipeline {
    agent any
    stages {
        stage('Git') {
            steps {
                echo 'Checking out code from Git.'
				checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'GithubHamza', url: 'https://github.com/ChocTitans/Java-Maven-JenkinsPipeline.git']]])	
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
                echo 'Setuping...'
                ansiblePlaybook credentialsId: 'devops', disableHostKeyChecking: true, installation: 'AnsibleAzure', inventory: 'Ansible/hosts.cfg', playbook: 'Ansible/Ansible-playbook.yml'        }
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
