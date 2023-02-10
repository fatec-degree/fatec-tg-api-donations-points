FROM amazoncorretto:17-alpine3.16
ENV DATABASE_URL=${DATABASE_URL} \
    DATABASE_USER=${DATABASE_USER} \
    DATABASE_PASSWORD=${DATABASE_PASSWORD}
RUN apk --no-cache add curl
COPY target/*.jar app.jar
CMD ["java", "-Xmx512m", "-jar", "-Dserver.port=${PORT}", "-Dspring.profiles.active=${PROFILE}", "/app.jar"]
