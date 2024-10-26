FROM python:3.11.7-slim-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -yq --no-install-recommends \
    && apt-get install ffmpeg libsm6 libxext6  -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY yolo_predictor/ yolo_predictor/

COPY pyproject.toml requirements.lock ./
RUN PYTHONDONTWRITEBYTECODE=1 pip install --no-cache-dir -r requirements.lock

COPY models/ models/
COPY transforms/ transforms/
COPY main.py visualize.py ./

CMD ["python", "main.py"]
