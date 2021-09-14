pipeline {
    agent any

    stages {
        stage("Clean"){
            steps {
                bat "mvn -version"
                bat "mvn clean"
            }
        }

        stage("test"){
            steps {
                bat "mvn test"
            }
        }

        stage('Build War'){
            steps {
                bat 'mvn package'
                stash includes: 'target/*.war', name: 'targetfiles'
            }
        }
        stage("sonarQube"){
            agent{
                label 'master'
            }
            steps{
                script{
                    scannerHome = tool 'SonarQube Scanner 4.6.2.2472'
                }
                withSonnarQubeEnv('Jenkins'){
                sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }

}