# Continuous Code Inspection with SonarQube
![Continuous Code Inspection with SonarQube](https://hosting.photobucket.com/images/i/gspasov2/Logo_Docker.png?width=1920&height=1080&fit=bounds)


## What is this project?
This is the repository that contains the [Continuous Code Inspection with SonarQube' course on Udemy](https://www.udemy.com/course/continuous-code-inspection-with-sonarqube/), delivered by me.
This course will guide you through the process of *installing*, *integrating* and *using* SonarQube with applications that utilize the **Maven** build system.
As a byproduct, you will also get to know DevOps tools like **Jenkins** and learn how to setup **continuous code inspection** for your codebase.

## How do I make use of this repository?
Clone the project to a prefered location on your computer.
You can then execute the commands we're discussing, step-by-step, in the course.

## What's that installer?
The shell file is used to prepare your -nix environment by installing all required dependencies, alongside with Jenkins and SonarQube.
The comments, placed on strategic positions in the script, give out most of the magic behind the scenes.

## How do I create a SonarQube report?
You can create reports for both Java, and Angular project.


For instance, you can use the following command to generate a Java test coverage report and push it to SonarQube: 

```mvn org.jacoco:jacoco-maven-plugin:prepare-agent verify org.jacoco:jacoco-maven-plugin:report sonar:sonar -Dsonar.jdbc.username=<database-username> -Dsonar.jdbc.password=<database-password> -Dsonar.host.url=<sonarqube-url> -Dsonar.jdbc.url=<database-url>```


Angular test coverage reporst are generated from the `frontend-client` folder using the `sonar-scan` Maven profile:

```mvn clean install -Dsonar-scan```
