FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements & install
COPY django5-blog-tutorial/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Django app
COPY django5-blog-tutorial/ ./django5-blog-tutorial/
WORKDIR /app/django5-blog-tutorial

# Expose port
EXPOSE 8000

# Run Gunicorn
CMD ["gunicorn", "django5_blog_tutorial.wsgi:application", "--bind", "0.0.0.0:8000"]
