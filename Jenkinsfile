node {
    def WORKSPACE = "/var/lib/jenkins/workspace/test-project"
    def dockerImageTag = "springboot-deploy${env.BUILD_NUMBER}"
try{
    stage('Clone Repo') {
        // for display purposes
        // Get some code from a GitHub repository
        git url: 'https://github.com/snehaNetzone/test-project.git',
            credentialsId: 'snehaNetzone',
            branch: 'master'
     }
    pipeline {
      agent {
        dockerfile {
            dir './home/ubuntu/test-project/dockerfile'
            label 'my-label'
            additionalBuildArgs '--build-arg version=1.0'
            args '-v /tmp:/tmp'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'maven --version'
            }
        }
    }
}   

   stage('Build docker') {
         dockerImage = docker.build("springboot-deploy:${env.BUILD_NUMBER}")
    }
    stage('Deploy docker'){
          echo "Docker Image Tag Name: ${dockerImageTag}"
          sh "docker stop test-project || true && docker rm springboot-deploy || true"
          sh "docker run --name springboot-deploy -d -p 9000:8080 springboot-deploy:${env.BUILD_NUMBER}"
    }
}catch(e){
    
    throw e
   }
