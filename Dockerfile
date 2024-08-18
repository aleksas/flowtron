FROM nvcr.io/nvidia/pytorch:20.12-py3
RUN apt-get update -y
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y ffmpeg libsndfile1 sox locales vim
RUN pip install --upgrade pip
RUN pip install gdown soundfile audioread sox Pillow inflect unidecode natsort pandas jupyter tgt srt peakutils protobuf==3.20 matplotlib==3.3.2 numpy==1.19.2 inflect==4.1.0 librosa==0.6.3 scipy==1.5.2 Unidecode==1.0.22 tensorboardX numba==0.48 torch torchaudio
RUN git clone --depth 1 https://github.com/NVIDIA/flowtron /flowtron
WORKDIR /flowtron
RUN git submodule update --init
WORKDIR /flowtron/tacotron2
RUN git submodule update --init
WORKDIR /flowtron
RUN mkdir -p /flowtron/models
RUN gdown 1Cjd6dK_eFz6DE0PKXKgKxrzTUqzzUDW- -O models/flowtron_ljs.pt
RUN gdown 1KhJcPawFgmfvwV7tQAOeC253rYstLrs8 -O models/flowtron_libritts.pt 
RUN gdown 1sKTImKkU0Cmlhjc_OeUDLrOLIXvUPwnO -O models/flowtron_libritts2p3k.pt
RUN gdown 1rpK8CzAAirq9sWZhe9nlfvxMF1dRgFbF -O models/waveglow_256channels_universal_v5.pt
RUN gdown 100YJu80Y-k5katrwzzE6rFoEHJ2rLmkc -O surprised_samples.zip ; unzip surprised_samples.zip -d ./data/
CMD ["jupyter-notebook", "--ip='*'", "--NotebookApp.token=''", "--NotebookApp.password=''"]
