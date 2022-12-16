FROM amazoncorretto:17-alpine3.16
EXPOSE 8080
ENV DATABASE_URL=jdbc:mysql://mysql:3306/db_donations DATABASE_USER=app DATABASE_PASSWORD=app
COPY target/*.jar app.jar
CMD ["java", "-jar", "/app.jar"]
