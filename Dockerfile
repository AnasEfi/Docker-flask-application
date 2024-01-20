# Use the official Python image as a base image
FROM python:3

# Set the working directory in the container
WORKDIR /app

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000

CMD ["python3", "-m" , "flask", "run", "--host=0.0.0.0"]

