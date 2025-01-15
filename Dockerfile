# Use official OpenJDK base image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the jar file from the Maven build to the container
COPY target/my-java-app-1.0-SNAPSHOT.jar /app/my-java-app.jar

# Expose port 8080 for the app
EXPOSE 8080

# Command to run the Java application
CMD ["java", "-jar", "my-java-app.jar"]
