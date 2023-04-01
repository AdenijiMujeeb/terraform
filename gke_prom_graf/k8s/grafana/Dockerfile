# Use a Python runtime as a parent image
FROM python:3.8-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the required packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose Grafana port
EXPOSE 3000

# Run Grafana when the container launches
CMD [ "grafana-server", "--config=/etc/grafana/grafana.ini", "--homepath=/usr/share/grafana" ]
