# Use Maven 3.6.3 base image for the builder stage
FROM maven:3.6.3 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project descriptor
COPY pom.xml .

# Resolve dependencies and cache them
RUN mvn dependency:go-offline

# Copy the application source code
COPY src src

# Build the application
RUN mvn package -DskipTests

# Final image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/SpringDocker.jar /app/SpringDocker.jar

# Expose the port your app runs on
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "SpringDocker.jar"]
