FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

ARG user=one-user

# Install apt get and vim :)
RUN apt-get update && apt install -y wget \ 
    vim \ 
    sudo

RUN addgroup --gid 1000 $user
RUN adduser --uid 1000 --gecos '' --disabled-password --ingroup $user $user
RUN echo "$user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd



USER $user

# Create directory for python reqs and for kaggle keys
RUN mkdir -p /home/$user/.kaggle \ 
             /home/$user/py_pkgs \
             /home/$user/data

COPY --chown=$user:$user kaggle.json /home/$user/.kaggle/kaggle.json
COPY requirements.txt /home/$user/py_pkgs/requirements.txt
RUN sudo pip install -r /home/$user/py_pkgs/requirements.txt

VOLUME /home/$user/data

WORKDIR /home/$user/data

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/home/laura/data --ip 0.0.0.0 --no-browser --allow-root"]