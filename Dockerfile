# [FIX 1] Gunakan Base Image 'slim' (Python 3.12)
# Ini akan menghilangkan 900+ vulnerability dari OS Debian lama
FROM python:3.12-slim

WORKDIR /app
COPY . /app

# [FIX 2] Update Flask & Hapus Cache
# Ini memperbaiki vulnerability HIGH pada Flask
RUN pip install --no-cache-dir flask==2.3.2

# [FIX 3] Gunakan User Non-Root
# Security Best Practice
RUN adduser --disabled-password appuser
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]
