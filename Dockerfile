FROM  tensorflow/tensorflow:nightly-gpu-py3

# Update List of avai. Packages and intall additional packages
RUN apt-get update && apt-get -y install \
			python3-tk \
	&& rm -rf /var/lib/apt/lists/* #cleans up apt cache -> reduces image size
	
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
  PyAudio \
  SpeechRecognition
  
VOLUME /src
WORKDIR /src
EXPOSE 8888
CMD jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root
