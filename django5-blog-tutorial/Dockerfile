FROM python:3.11-slim

# Prevent Python from writing .pyc files and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies for building and psycopg2 (Postgres driver)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Expose Django port
EXPOSE 8000

# Gunicorn entrypoint (production server)
CMD ["gunicorn", "django5_blog_tutorial.wsgi:application", "--bind", "0.0.0.0:8000"]
