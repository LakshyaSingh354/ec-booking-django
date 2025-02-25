# Use official Python image as base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=consulting.settings \
    PATH="/home/appuser/.local/bin:$PATH" \
    DATABASE_HOST=db \
    DATABASE_PORT=3306

# Create non-root user first
RUN useradd -m appuser

# Set work directory and create necessary directories
WORKDIR /app

# Install required system packages including MySQL client
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    default-libmysqlclient-dev \
    python3-dev \
    build-essential \
    netcat-traditional \
    default-mysql-client && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /app/media /app/static && \
    chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Install Python dependencies
COPY --chown=appuser:appuser requirements.txt /app/
RUN pip install --user --no-cache-dir -r requirements.txt

# Copy project files with correct ownership
COPY --chown=appuser:appuser . /app/
COPY --chown=appuser:appuser .env /app/

# Create startup script
COPY --chown=appuser:appuser docker-entrypoint.sh /app/
COPY --chown=appuser:appuser advertsneak_epitome.sql /app/

RUN chmod +x /app/docker-entrypoint.sh

# Expose port
EXPOSE 80

# Set entrypoint
ENTRYPOINT ["/app/docker-entrypoint.sh"]

# Default command
CMD ["gunicorn", "consulting.wsgi:application", "--bind", "0.0.0.0:80"]