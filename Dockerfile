FROM python:3.11.0

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5001

# Define environment variable
ENV FLASK_APP=app.py

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]

