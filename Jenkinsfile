pipeline {
    agent {
        dockerfile {
            dir './path/to/dockerfile'
            label 'my-label'
            additionalBuildArgs '--build-arg version=1.0'
            args '-v /tmp:/tmp'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'gradle --version'
            }
        }
    }
}
