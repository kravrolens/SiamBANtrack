CUDA_VISIBLE_DEVICES=2 python tools/test.py 	\
	--snapshot configs/siamban_r50_l234/model.pth 	\
	--dataset VOT2018 \
	--config configs/siamban_r50_l234/config.yaml \
	--dataset_root /home/liuj/Data/VOT2018