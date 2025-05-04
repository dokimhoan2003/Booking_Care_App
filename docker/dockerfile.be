# Step 1: Build the jar file using maven
FROM --platform=${BUILDPLATFORM:-linux/amd64} maven:3.9.9-amazoncorretto-17-debian AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY ./BookingCare-BE/pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code
COPY ./BookingCare-BE/src ./src
COPY ./BookingCare-BE/mvnw ./mvnw
COPY ./BookingCare-BE/mvnw.cmd ./mvnw.cmd

# Build the application
RUN mvn package -DskipTests

# Step 2: Runtime using openjdk to reduce image size
ARG BUILDPLATFORM=linux/amd64
FROM --platform=${BUILDPLATFORM} openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Environment variables with default values
ENV SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/hospitalmanagement
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=""
ENV CLOUDINARY_CLOUD_NAME=""
ENV CLOUDINARY_API_KEY=""
ENV CLOUDINARY_API_SECRET=""
ENV EMAIL_USERNAME=""
ENV EMAIL_APP_PASSWORD=""

# Expose the application port
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

