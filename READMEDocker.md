1. Clone repo:

```
git clone https://github.com/SurajSubramanian/EmotionDetection.git
```

2. Build image and run container:

```
docker build -t surajsubramanian/emotiondetection .


docker run -v $(pwd)/cut.mp4:/app/cut.mp4 -v /app/yolo_predictor -v $(pwd):/app --name emotiondetection-container surajsubramanian/emotiondetection
```

OR

Use docker-compose:

```
docker-compose up
```

You can also use `docker-compose up --no-build` if you already have the image.
