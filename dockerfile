FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel
ENV TZ=Asia/Tokyo
WORKDIR /data
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# depends on GPG key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

RUN apt-get update
RUN apt-get install -y vim less
RUN apt-get install -y libsndfile1-dev

RUN pip install --upgrade pip
RUN pip install magenta --no-cache-dir
# for markup safe / somehow work
RUN pip install Flask