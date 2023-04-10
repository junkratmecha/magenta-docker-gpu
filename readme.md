# magenta-docker(gpu)
python with magenta with gpu for training

# my development envrionment(gpuの環境のことは正直よく分かりません。)
OS: Windows11
CPU:Intel Core i7-10700F
GPU:Geforce RTX3060

# introduction 
docker-compose build --no-cache  
docker-compose up -d

# tenosorboard (コンテナ外 or host接続)
py -m tensorboard.main --logdir="yourpath" to\run1

# 学習の進め方
[melody_rnn.md](./melody_rnn.md)