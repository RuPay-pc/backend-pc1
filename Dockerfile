FROM maven:3.8.5-openjdk-17 AS build

# Define o diretório de trabalho como o diretório do módulo interno
WORKDIR /backend-rupay

# Copia o código-fonte do módulo interno
COPY . .

# Executa o comando mvn clean dentro do módulo interno
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /backend-rupay/target/backend-rupay-0.0.1-SNAPSHOT.jar backend-rupay-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","backend-rupay-0.0.1-SNAPSHOT.jar"]