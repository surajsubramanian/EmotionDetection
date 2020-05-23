# Foobar

This is an application to detect emotions from Tom and Jerry videos.

## Installation

The repository can either be cloned or downloaded as a zip.

## Usage

The trained yolo detector and facial expression detector's weights should be first downloaded from the following links : 
YOLO Detection module : https://drive.google.com/open?id=1thrygMSIDwuidJTFWKJjywEUNFGLPkbf (1)
Facial Expression module : https://drive.google.com/open?id=1nTRW5B9TyjBH_ajOhCN0_qQSI4jRyfYM (2)

The YOLO Detector weights (1) should be placed inside the yolo_predictor directory and the
Facial Expression weights (2) should be placed in the root directory.

To run on the default video cut.mp4, following command can be run from the root directory
```python
python main.py
```
To run on some other video (ex : movie.mp4 )
```python
python main.py -i movie.mp4
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
