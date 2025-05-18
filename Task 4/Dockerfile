FROM maven:amazoncorretto AS builder
WORKDIR /build
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY . ./
RUN mvn package -DskipTests

FROM eclipse-temurin:24_36-jre-alpine-3.21
WORKDIR /app
COPY --from=builder /build/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

