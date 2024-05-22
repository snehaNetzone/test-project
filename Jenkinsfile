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
