## SiamBAN (CVPR'20) object tracking Tutorial for BYRers

***

<div align="center">
  <img src="demo/output/12.gif" width="1280px" />
  <img src="demo/output/34.gif" width="1280px" />
  <p>Examples of SiamBAN outputs. The green boxes are the ground-truth bounding boxes of VOT2018, the yellow boxes are results yielded by SiamBAN.</p>
</div>


### 1. 环境配置

```bash
git clone https://github.com/kravrolens/SiamBANtrack.git
conda create -n track python=3.9
conda activate track
conda install pytorch torchvision pytorch-cuda=11.8 -c pytorch -c nvidia -y
sudo apt-get install  libopenmpi-dev
conda install gcc_linux-64
pip install -r requirements.txt
python setup.py build_ext --inplace
export PYTHONPATH=/path/to/siamban:$PYTHONPATH
# 例如：export PYTHONPATH=/home/liuj/Code/SiamBAN:$PYTHONPATH
```

### 2. 下载预训练权重
```bash
cd configs/siamban_r50_l234
wget https://drive.google.com/file/d/1SJwPUpTQm6xL44-8jLvDrSMhOzVsbLAZ/view?usp=sharing
```

### 3. demo实现
```bash
bash scripts/demo.sh
```
输出在demo/文件夹下。

### 4. VOT2018测试数据集准备
```bash
cd Data
wget https://drive.google.com/file/d/13w_N3QAHWZY6cP6m08eKaHhOK4A1dcbq/view?usp=drive_link
unrar x VOT2018.rar
```
下载json文件，并把VOT2018.json文件放到~/Data/VOT2018/文件夹下。
```bash
cd VOT2018
wget https://drive.google.com/file/d/1yRRumsjakApQc5XxbDx989H9i0Dxupaw/view?usp=drive_link
```

数据路径基本格式为：
```bash
$~/Data/VOT2018/
$~/Data/VOT2018/ants1/     
$~/Data/VOT2018/ants3/                
...
$~/Data/VOT2018/VOT2018.json/
```

### 4. 测试
```bash
bash scripts/test.sh
```
测试结果在results/VOT2018文件夹下。
```bash
bash scripts/eval.sh
```
输出性能结果。

### 5. 训练
首先准备COCO训练数据集，下载数据集并解压：
```bash
cd training_dataset
wget http://images.cocodataset.org/zips/train2017.zip
wget http://images.cocodataset.org/zips/val2017.zip
wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip

unzip ./train2017.zip
unzip ./val2017.zip
unzip ./annotations_trainval2017.zip
cd pycocotools && make && cd ../..
```
裁剪和生成数据信息（大约10分钟）
```bash
#python par_crop.py [crop_size] [num_threads]
python par_crop.py 511 12
python gen_json.py
```
然后下载[backbone](https://drive.google.com/drive/folders/1DuXVWVYIeynAcvt9uxtkuleV6bs6e3T9)权重，放到./pretrained_models文件夹下，最后开始训练：
```bash
bash scripts/train.sh
```


### 6. 参考
- [Siamese Box Adaptive Network for Visual Tracking](https://arxiv.org/abs/2003.06761)
- [official repo](https://github.com/hqucv/siamban/tree/master)