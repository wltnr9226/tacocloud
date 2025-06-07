# --- Build Stage ---
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline

COPY . .
RUN mvn clean package -DskipTests

# --- Run Stage ---
FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /app/target/tacocloud-0.0.1-SNAPSHOT.jar taco.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "taco.jar"]