FROM python:3.9

# Copy the application code into the container
COPY . /app/

# Set the working directory
WORKDIR /app


# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg


# Install MongoDB
RUN apt-get install -y gnupg && \
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list && \
    apt-get update && apt-get install -y mongodb-org && \
    rm -rf /var/lib/apt/lists/*

# Install the package in editable mode
RUN pip install -e .

# Start the application
CMD ["python", "-m", "videoserver.app"]

