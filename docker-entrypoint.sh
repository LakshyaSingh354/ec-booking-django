set -e

# Wait for MySQL to be ready
echo "Waiting for MySQL..."
while ! nc -z $DATABASE_HOST $DATABASE_PORT; do
    sleep 1
done
echo "MySQL is ready!"

# Collect static files at runtime
# python manage.py collectstatic --noinput || true

# Apply database migrations
python manage.py makemigrations --noinput || true
python manage.py migrate --noinput || true

# Start server
exec "$@"