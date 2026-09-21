pipeline { 
    agent any 
    stages { 
        stage('Compile') { 
            steps { sh 'mvn clean compile' } 
            } 
            stage('Unit Tests') { 
                steps { sh 'mvn test -Dtest=\*UnitTest' } 
                } 
                stage('Package') { 
                    steps { sh 'mvn package -DskipTests' } 
                    } 
                    } 
                    post { 
                        failure { sh 'bash scripts/rollback.sh' } 
                        } 
                        }