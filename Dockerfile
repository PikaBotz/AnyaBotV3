FROM node:23-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    webp \
    git \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    libdav1d-dev \
    libaom-dev \
    libgl1 \
    libglib2.0-0 \
    unzip \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@latest

WORKDIR /anya-gen<3

COPY index.js ./

RUN node index.js

COPY . .

RUN npm install && \
    if [ -f requirements.txt ]; then pip3 install -r requirements.txt --break-system-packages; fi

CMD ["node", "index.js"]
