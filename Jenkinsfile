pipeline {
    agent any

    stages {
        stage("Build"){
            steps {
                bat "mvn -version"
                bat "mvn clean install"
            }
        }

        stage('Build Jar'){
            steps {
                bat 'mvn package'
                stash includes: 'target/*.war', name: 'targetfiles'
            }
        }
    }

}