FROM  tensorflow/tensorflow:nightly-gpu-py3

# Update List of avai. Packages and intall additional packages
RUN apt-get update && apt-get -y install \
			python3-tk \
	&& rm -rf /var/lib/apt/lists/* #cleans up apt cache -> reduces image size
RUN apt-get -y install python3-dev
RUN apt-get update && apt-get install -y git
RUN apt-get -y install htop
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
  spectrum
RUN pip3 install pysptk  
RUN pip3 install samplerate
RUN add-apt-repository ppa:jonathonf/ffmpeg-4
RUN apt-get update
RUN apt-get -y install ffmpeg && apt-get -y install libavcodec-extra 
RUN apt-get -y install sox

RUN wget http://www.cmake.org/files/v3.12/cmake-3.12.1.tar.gz 
RUN tar -xvzf cmake-3.12.1.tar.gz
RUN cd cmake-3.12.1/ 
RUN ./configure
RUN make
RUN make install
RUN update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force

RUN pip3 install https://github.com/DavidDiazGuerra/gpuRIR/zipball/master
VOLUME /src
WORKDIR /src
EXPOSE 8888
CMD jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root
