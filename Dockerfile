FROM python:3.11.7-slim-bullseye

WORKDIR /app

RUN apt-get update && \
    apt-get install wget ffmpeg libsm6 libxext6  -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/yolo_predictor \
    && wget --no-check-certificate -O "/app/yolo_predictor/yolov3_custom_9700.weights" "https://drive.usercontent.google.com/download?id=1thrygMSIDwuidJTFWKJjywEUNFGLPkbf&export=download&authuser=1&confirm=t" \
    && wget --no-check-certificate -O "/app/yolo_predictor/PublicTest_model.t7" "https://drive.google.com/u/0/uc?id=1nTRW5B9TyjBH_ajOhCN0_qQSI4jRyfYM&export=download"

COPY pyproject.toml requirements.lock ./
RUN PYTHONDONTWRITEBYTECODE=1 pip install --no-cache-dir -r requirements.lock

COPY yolo_predictor/ yolo_predictor/
COPY models/ models/
COPY transforms/ transforms/
COPY main.py visualize.py ./

CMD ["python", "main.py"]
