FROM python:3.8.8
# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN apt-get update && apt-get install -y cmake \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    libgl1-mesa-glx \
 && rm -rf /var/lib/apt/lists/* \
 && pip install --no-cache-dir --upgrade pip
# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install Flask --upgrade
RUN pip install Werkzeug --upgrade

CMD ["python", "runserver.py"]
