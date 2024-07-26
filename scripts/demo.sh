CUDA_VISIBLE_DEVICES=2 python tools/demo.py \
    --config configs/siamban_r50_l234/config.yaml \
    --snapshot configs/siamban_r50_l234/model.pth \
    --save --video demo/bag.avi # (in case you don't have webcam)