## Data Collection

First, the provided training video, along with 4 other videos where used to extract frames. 
The FrameExtractor.py code was used to accomplish this.

## Data Preparation

- These frames were used as the training dataset for YOLO algorithm, used to detect the locations of the faces of tom and jerry in the frames.For all these frames, the locations of Tom and Jerry was  manually fixed using LabelImg [1], which generates txt files for each image (0 for Jerry and 1 for Tom)

- Also the txt files generated were used to generate the faces of Tom and Jerry, which is used as training data for the Emotion Detection module.

## Solution Approach

The solution uses 2 modules : 

- Object Detection module to locate the faces of Tom and Jerry, given the frame. 
- Secondly, an emotion detection module is used to predict the type of emotion from the given face

## Training 

YOLO

- Later, the Darknet YOLO algorithm, which was cloned from the github repository[2] was modified to train on the frames in our training data.
 - Needed changes were made to use the code on the prepared dataset. Later this folder was zipped and uploaded to google drive.
- Weights were saved in google drive for every 100 epochs, after 8000 epochs results were observed more frequently. After about 10000 epochs, the acquired weights were  able to correctly identify the faces of Tom and Jerry from the frames.
- The yolo_train/darknet_yolo.py file was used in Google Colab to perform training. 

Emotion Detection

- The repository was originally used to detect emotions in human faces [4]. The code which was used to detect the correct emotion from 7 classes, was modified to classify the given face into 4 emotions : happy, angry, sad, surprised.
- The labels generated using LabelImg was used to crop the faces of Tom and Jerry into separate images using ImageExtractor.py
- The code requires that the dataset be of the format of the FER dataset, for this purpose, the images were converted to a csv file of FER format using the code fer-dataset/FER_generator.pyo
- For the purpose of training the module, the emotiondetection.py was used in Colab to train the model for about 150 epochs.

## PREDICTION

- Initially the training video alone was used to train the YOLO model and the weights were obtained. Later to increase the accuracy, 4 more videos were used to generate training data, and the YOLO model with pre-trained weights from  the training video was trained using this data. This way is able to get a better set of weights, avoiding underfitting and overfitting issues. The idea is to overfit on  a  small subset of the training data, before using the rest of the training data. This way our neural network is able to obtain a better fit.

- For getting the locations, priority specified in the problem statement was taken into consideration, i.e) If both Tom and Jerry were present in a frame, the face of Tom is considered for detection of emotion.

- Finally the faces generated are used by the  Emotion Detection module to predict emotions and subsequently generate the csv file for submission. For this purpose the emotion_predictor/FacialExpression.ipynb file was implemented. If no faces were present in  a frame, the emotion is considered to be Unknown.

## TOOLS USED
LabelImg - used to manually generate training data for the YOLO model

## Libraries and Programming Languages
OpenCV - used for implementing the YOLO model 

PyTorch - used for implementing

Python - libraries like pandas, os and shutil have been used extensively to implement the Emotion Recognition system

## Failed Approaches

- The HAAR-Cascade xml files in OpenCV and other existing Face Detection programs were used to try to detect the faces, but these algorithms did not work for cartoon faces, hence a YOLO model was implemented

- Also initially the YOLO model was trained to detect complete body of Tom and Jerry which failed big time, hence the YOLO model was again trained to detect only the faces.


## REFERENCES 

[1] LabelImg (https://github.com/tzutalin/labelImg)
[2] Darknet YOLO (https://github.com/pjreddie/darknet)
[3] Darknet YOLO using OpenCV (https://blog.francium.tech/custom-object-training-and-detection-with-yolov3-darknet-and-opencv-41542f2ff44e)
[4] Emotion Recognition using PyTorch (https://github.com/WuJie1010/Facial-Expression-Recognition.Pytorch)
