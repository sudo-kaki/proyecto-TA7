pipeline {
    agent any
    tools {
        maven 'Maven 3.9'
        jdk 'JDK 17'
    }
    environment {
        ARTIFACTORY_URL = 'https://artifactory.empresa.cl/repository/maven-releases/'
    }
    stages {
        stage('Checkout & Validation') {
            steps {
                echo '==> Descargando código fuente desde Git...'
                checkout scm
            }
        }
        stage('Compile & Static Analysis') {
            steps {
                echo '==> Compilando código y ejecutando análisis estático (SAST/SonarQube)...'
                sh 'mvn clean compile'
            }
        }
        stage('Unit Tests (Fast Feedback)') {
            steps {
                echo '==> Ejecutando Pruebas Unitarias atómicas...'
                sh 'mvn test -Dtest=*UnitTest'
            }
            post {
                always {
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
        }
        stage('Integration Tests') {
            steps {
                echo '==> Ejecutando Pruebas de Integración entre componentes...'
                sh 'mvn verify -Dtest=*IntegrationTest'
            }
            post {
                always {
                    junit '**/target/failsafe-reports/TEST-*.xml'
                }
            }
        }
        stage('Package Lightweight Artifact') {
            steps {
                echo '==> Generando artefacto intermedio ligero listo para Staging...'
                sh 'mvn package -DskipTests'
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
    post {
        success {
            echo '✅ Pipeline de CI completado con éxito.'
        }
        failure {
            echo '❌ Error detectado en el Pipeline. Notificando al equipo...'
        }
    }
}
