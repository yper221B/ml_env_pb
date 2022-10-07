FROM continuumio/anaconda3:latest

RUN apt-get update && apt-get install -y sudo wget vim curl git gawk make gcc

#RUN sudo apt install ./code_1.71.2-1663191218_amd64.deb 

RUN conda update -n base conda \
  && conda create -n kaggle-env python=3.10 \
  && . activate kaggle-env \
  && conda install Pytorch \
  && conda install -c conda-forge mecab-python3 \
  && conda install -c conda-forge janome \
  && pip install -U pandas-profiling \
  && conda install -c conda-forge missingno \
  && conda install -c conda-forge htmlmin \
  && pip install markupsafe==2.0.1 \
  && conda install -c conda-forge pysimplegui
VOLUME /data

EXPOSE 8888

CMD jupyter notebook --notebook-dir=/data/notebooks --ip=0.0.0.0 --port=8888 --no-browser --allow-root
