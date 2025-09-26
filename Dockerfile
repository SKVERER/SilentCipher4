FROM python:3.11-slim

# Install ffmpeg for pydub
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Streamlit listens on PORT env
ENV PORT=8080
EXPOSE 8080

CMD ["streamlit", "run", "app.py", "--server.port=${PORT}", "--server.address=0.0.0.0"]
