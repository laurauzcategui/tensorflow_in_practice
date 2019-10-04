FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

VOLUME /data

WORKDIR /data

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/data --ip 0.0.0.0 --no-browser --allow-root"]