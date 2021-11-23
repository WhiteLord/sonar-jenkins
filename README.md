# This is a deprecated branch. 

## Please, switch to using the master branch.

### Using this branch may result in undesired behaviour.

Java test coverage reports are generated with: 
mvn org.jacoco:jacoco-maven-plugin:prepare-agent verify org.jacoco:jacoco-maven-plugin:report sonar:sonar -Dsonar.jdbc.username=sonar -Dsonar.jdbc.password=password -Dsonar.host.url=http://172.16.154.131:9000 -Dsonar.jdbc.url=jdbc:postgresql://172.16.154.131/sonarqube

Angular test coverage reporst are generated with:
mvn clean install -Dsonar-scan from frontend-client folder