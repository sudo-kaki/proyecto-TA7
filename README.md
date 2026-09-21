# Proyecto de Automatización de Pruebas y Pipeline CI/CD

Repositorio que contiene la implementación práctica del proyecto de automatización de pruebas de software, control de versiones con Git, orquestación con Maven y pipeline de CI/CD con Jenkins.

## Estructura del Repositorio
- `pom.xml`: Configuración de dependencias (JUnit 5, Cucumber BDD, Selenium).
- `Jenkinsfile`: Definición de la tubería de Integración Continua.
- `src/main/java`: Código fuente de la aplicación (`Calculator.java`).
- `src/test/java`: Suites de pruebas unitarias atómicas, de integración y mapeos BDD.
- `src/test/resources`: Escenarios BDD Gherkin (`login.feature`) y planes JMeter.
- `scripts/rollback.sh`: Script ejecutable para recuperación y rollback automático.

## Comandos Principales
```bash
# Compilar el proyecto
mvn clean compile

# Ejecutar pruebas unitarias
mvn test -Dtest=*UnitTest

# Ejecutar pruebas BDD de aceptación
mvn test -Dtest=RunCucumberTest

# Generar paquete de artefacto
mvn package -DskipTests
```
