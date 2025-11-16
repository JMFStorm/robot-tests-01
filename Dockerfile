# --- Base image ---
FROM python:3.11-slim

# --- Install system dependencies ---
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libasound2 \
    libpangocairo-1.0-0 \
    libpango-1.0-0 \
    libgtk-3-0 \
    libgbm1 \
    && rm -rf /var/lib/apt/lists/*

# --- Install Node.js (before rfbrowser init)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# --- Install Robot Framework + libraries ---
RUN pip install --no-cache-dir \
    robotframework \
    robotframework-browser \
    robotframework-requests

# --- Initialize Playwright (browser binaries) ---
RUN rfbrowser init

# --- Copy your test project ---
WORKDIR /robot
COPY . .

# --- Make your script executable ---
RUN chmod +x run_tests.sh

# --- Default entrypoint ---
CMD ["./run_tests.sh"]
