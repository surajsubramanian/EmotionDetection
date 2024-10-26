# Emotion Detection from Tom and Jerry videos

This is an application to detect emotions from Tom and Jerry videos.

## Installation using docker

You can build the docker image and run it like:
```bash
docker build -t surajsubramanian/emotiondetection .

docker run -v $(pwd)/tests/inputs/input.mp4:/app/tests/inputs/input.mp4 -v /app/yolo_predictor -v $(pwd):/app --name emotiondetection-container surajsubramanian/emotiondetection
```

or use docker-compose like `docker-compose up`. You can also use `docker-compose up --no-build` if you already have the image.

## Usage

The trained yolo detector and facial expression detector's weights should be first downloaded from the following links :

[YOLO Detection module (1)](https://drive.google.com/open?id=1thrygMSIDwuidJTFWKJjywEUNFGLPkbf)

[Facial Expression module (2)](https://drive.google.com/open?id=1nTRW5B9TyjBH_ajOhCN0_qQSI4jRyfYM)

The YOLO Detector weights (1) should be placed inside the yolo_predictor directory and the
Facial Expression weights (2) should be placed in the root directory.

As long videos may take longer time, it would be better to convert the video into small clips as in

```
ffmpeg -i movie.mp4 -ss 00:00:03 -t 00:00:08 -async 1 tests/inputs/input.mp4
```

(refer : https://stackoverflow.com/questions/18444194/cutting-the-videos-based-on-start-and-end-time-using-ffmpeg)

To run on the default video tests/inputs/input.mp4, following command can be run from the root directory

```bash
python main.py
```

To run on some other video (ex : movie.mp4 )

```bash
python main.py -i movie.mp4
```

OpenCV allows us to generate videos with no audio. Hence the audio has to be extracted separately and combined with the output video file. We use ffmpeg for this purpose.

For generating audio file from the input video

```bash
ffmpeg -i filename.mp4 filename.mp3
```

For combining the audio and generated video

```bash
ffmpeg -i video.mp4 -i audio.mp3 -c:v copy -c:a aac output.mp4
```

## Implementation

The details of implementation can be found in [Implementation.md](https://github.com/SurajSubramanian/EmotionDetection/blob/main/Implementation.md)

## Result

[![Emotion Detection - Tom and Jerry](https://raw.githubusercontent.com/SurajSubramanian/EmotionDetection/main/docs/Jerry.png)](https://www.youtube.com/watch?v=qWu9L-J4HCM "Emotion Detection - Click to Watch!")

Click above picture to view video

## Development

The project uses rye as the package manager. You can find the installation instructions [here](https://rye.astral.sh/guide/installation/)

To setup the project, simply run `rye sync` and add new packages like `rye add "flask>=2.0"`

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)

Thanks for reading :)
