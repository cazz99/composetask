FROM openjdk:17-slim

# Install Python
RUN apt-get update && apt-get install -y python3

WORKDIR /app

# Copy the JAR file
COPY target/composetask-0.0.1-SNAPSHOT.jar /app/composetask-0.0.1-SNAPSHOT.jar

# Copy the Python script
COPY hello.py /hello.py

# Set the entry point to run both Java and Python
ENTRYPOINT ["sh", "-c", "java -jar /app/composetask-0.0.1-SNAPSHOT.jar && python3 /hello.py"]
