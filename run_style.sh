#! /bin/bash

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

