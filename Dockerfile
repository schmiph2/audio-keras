FROM  tensorflow/tensorflow:nightly-gpu-py3

# Update List of avai. Packages and intall additional packages
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata
RUN apt-get update && apt-get -y install \
			python3-tk \
	&& rm -rf /var/lib/apt/lists/* #cleans up apt cache -> reduces image size
RUN apt-get -y install python3-dev
RUN apt-get update && apt-get install -y git
RUN apt-get -y install htop
RUN apt-get -y install graphviz
RUN pip3 install --upgrade -I setuptools
RUN pip3 install --upgrade keras 	
RUN pip3 install \
  jupyter \
  matplotlib \
  seaborn	\
  Image \
  scikit-learn \
  lxml \
  joblib \
  h5py \
  python_speech_features \
  sox \
  librosa \
  SpeechRecognition \
  spectrum \
  tqdm \
  jupyterlab \
  tornado \
  jupyter-tensorboard\ 
  cython \
  pydot \
  graphviz 
  nvidia-ml-py3

RUN pip3 install https://github.com/schmiph2/pystoi/archive/master.zip
RUN pip3 install https://github.com/schmiph2/python-pesq/archive/master.zip
RUN pip3 install https://github.com/schmiph2/pysepm/archive/master.zip

RUN pip3 install pysptk  
RUN pip3 install samplerate
RUN add-apt-repository ppa:jonathonf/ffmpeg-4
RUN apt-get update
RUN apt-get -y install ffmpeg && apt-get -y install libavcodec-extra 
RUN apt-get -y install sox
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get -y install nodejs
RUN npm install
RUN jupyter labextension install jupyterlab_tensorboard
RUN pip install jupyterlab_github
RUN jupyter labextension install @jupyterlab/github
VOLUME /src
WORKDIR /src
EXPOSE 8888
CMD jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root
