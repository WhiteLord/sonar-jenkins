# Continuous Code inspection with SonarQube
![Continuous Code inspection with SonarQube](https://github.com/WhiteLord/sonar-jenkins/blob/master/Continuous-code-inspection-with-sonarqube.png?raw=true)

## What is this repository?
This repository covers the [Continuous Code inspection with SonarQube](https://www.udemy.com/course/continuous-code-inspection-with-sonarqube) course content.

## How do I use the repository?
To make use of all the features of this repository, please use the **master** branch.
All other branches contain older version of Angular, thus containing dependencies which are either abandonware or contain vulnerabilities.

`git clone` the repository to a prefered location on your machine and follow the course content!

## How do I generate unit test coverage data? 

- Java test coverage reports are generated with: 
` mvn org.jacoco:jacoco-maven-plugin:prepare-agent verify org.jacoco:jacoco-maven-plugin:report sonar:sonar -Dsonar.jdbc.username=sonar -Dsonar.jdbc.password=password -Dsonar.host.url=http://<sonarqube-address>:9000 -Dsonar.jdbc.url=jdbc:postgresql://<postgre-address>/sonarqube `

- Angular test coverage reporst are generated with:
`mvn clean install -Dsonar-scan from frontend-client folder`

## Can I get the course with a discount?
Sure you can! Just ping me on [LinkedIn](https://www.linkedin.com/in/georgi-spasov-/)