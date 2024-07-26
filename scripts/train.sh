CUDA_VISIBLE_DEVICES=2,3 python -m torch.distributed.launch \
    --nproc_per_node=2 \
    --master_port=2333 \
    tools/train.py --cfg configs/siamban_r50_l234/config.yaml