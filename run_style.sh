#! /bin/bash
pip install wget
mkdir data
cd data
wget http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat
mkdir bin
wget http://msvocds.blob.core.windows.net/coco2014/train2014.zip
unzip train2014.zip

cd /.

python style.py --style examples/style/cherry-tree-in-bloom-1905.jpg \
  --checkpoint-dir checkpoint/ \
  --test examples/content/chicago.jpg \
  --test-dir examples/content/testimg \
  --content-weight 1.5e1 \
  --checkpoint-iterations 1000 \
  --batch-size 20

python evaluate.py --checkpoint checkpoint/model.ckpt \
  --in-path examples/content/chicago.jpg \
  --out-path examples/results/

