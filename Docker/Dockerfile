FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy application files to the container
COPY . /app

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Create the tmp_ai_check.txt file
RUN touch /app/tmp_ai_check.txt

# Expose port 5000
EXPOSE 5000

# Default command to run the application
CMD ["flask", "run"]
