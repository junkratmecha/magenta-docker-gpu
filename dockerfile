# FROM pytorch/pytorch:1.9.0-cuda10.2-cudnn7-runtime
# FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# depends on GPG
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ******

RUN apt-get update
RUN apt-get install -y vim less
RUN apt-get install -y libsndfile1-dev

RUN pip install --upgrade pip
RUN pip install magenta --no-cache-dir
RUN pip install Flask