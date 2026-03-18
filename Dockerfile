FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY google_ads_server.py .
# Credentials mounted at runtime via Cloud Run secrets
ENV GOOGLE_ADS_CREDENTIALS_PATH=/secrets/google-ads-credentials.json
CMD ["python", "google_ads_server.py"]
