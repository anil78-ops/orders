# Build stage
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Run application
ENTRYPOINT ["java","-jar","/app/app.jar"]