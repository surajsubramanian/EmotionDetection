import pandas as pd
from skimage import io
from skimage.transform import resize
import os
import numpy as np

def rgb2gray(rgb):
    return np.dot(rgb[...,:3], [0.299, 0.587, 0.114])

columns = ['emotion', 'pixels', 'Usage']
df = pd.DataFrame(columns=columns)

mapper = {'happy':0, 'angry':1, 'sad':2, 'surprised':3}
df1 = pd.DataFrame(columns=columns)
root1,root2,root3,root4 = 'custom_data/train/happy/', 'custom_data/train/angry/', 'custom_data/train/sad/', 'custom_data/train/surprised/'
root_train = [root1, root2, root3, root4]

for r in root_train:
    listdir = os.listdir(r)
    if '.DS_Store' in listdir:
        listdir.remove('.DS_Store')
    for i,img in enumerate(listdir):
        raw_img = io.imread(r + img)
        gray = rgb2gray(raw_img)
        gray = resize(gray, (48,48), mode='symmetric').astype(np.uint8)
        s = list(gray.flatten())
        s = ' '.join(str(x) for x in s)
        df1.loc[len(df1)] = [mapper[r.split('/')[-2]], s, 'Training']
df1 = df1.sample(frac=1)

df2 = pd.DataFrame(columns=columns)
root1,root2,root3,root4 = 'custom_data/test/happy/', 'custom_data/test/angry/', 'custom_data/test/sad/', 'custom_data/test/surprised/'
root_test = [root1, root2, root3, root4]

for r in root_test:
    listdir = os.listdir(r)
    if '.DS_Store' in listdir:
        listdir.remove('.DS_Store')
    for i,img in enumerate(listdir):
        raw_img = io.imread(r + img)
        gray = rgb2gray(raw_img)
        gray = resize(gray, (48,48), mode='symmetric').astype(np.uint8)
        s = list(gray.flatten())
        s = ' '.join(str(x) for x in s)
        df2.loc[len(df2)] = [mapper[r.split('/')[-2]], s, 'PublicTest']

df2 = df2.sample(frac=1)
df1 = df1.append(df2)
df1.to_csv('tom_jerry.csv', index=None)
