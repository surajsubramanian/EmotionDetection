FROM python:3.7.13-bullseye
# RUN apk update

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY . .

WORKDIR /app/yolo_predictor
RUN wget -O "yolov3-custom_9700.weights" "https://drive.google.com/uc?id=1thrygMSIDwuidJTFWKJjywEUNFGLPkbf&confirm=t&uuid=cdb31575-aa9a-4341-83a6-bf979cf512e8"
RUN wget -O "PublicTest_model.t7" "https://drive.google.com/u/0/uc?id=1nTRW5B9TyjBH_ajOhCN0_qQSI4jRyfYM&export=download"

WORKDIR /app

CMD ["python", "main.py"]