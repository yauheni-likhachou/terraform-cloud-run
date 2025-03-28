FROM python:3.9-slim

COPY app.py .

# Install Flask
RUN pip install flask

# Expose port 8080
EXPOSE 8080

# Start the application
CMD ["python", "app.py"]