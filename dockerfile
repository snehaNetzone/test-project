# Docker Build Maven Stage
FROM maven:4-jdk-17-alpine AS build

# Copy folder in docker
WORKDIR /opt/app
COPY ./ /opt/app
RUN mvn clean install -DskipTests

# Run spring boot in Docker
FROM openjdk:17-jdk-alpine
COPY --from=build /opt/app/target/*.jar app.jar
ENV PORT 9000
EXPOSE $PORT
ENTRYPOINT ["java","-jar","-Dserver.port=${PORT}","app.jar"]
