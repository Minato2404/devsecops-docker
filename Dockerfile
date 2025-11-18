# Menggunakan image slim untuk mengurangi attack surface
FROM python:3.12-slim

WORKDIR /app
COPY . /app

# Update library ke versi aman & hapus cache
RUN pip install --no-cache-dir flask==2.3.2

# Security Best Practice: Gunakan user non-root
RUN adduser --disabled-password appuser
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]
