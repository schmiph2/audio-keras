bootstrap:docker  
From:tensorflow/tensorflow:nightly-gpu-py3


#---------------------------------------------------------------------
%environment
#---------------------------------------------------------------------
export PATH=/bin:/usr/bin:/usr/local/bin:/usr/local/cuda/bin:
export LC_ALL=C

#---------------------------------------------------------------------
%post
#---------------------------------------------------------------------

apt-get update && apt-get -y install \
			python3-tk \

	
pip3 install --upgrade -I setuptools
pip3 install --upgrade keras 

	
pip3 install \
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
SpeechRecognition \
