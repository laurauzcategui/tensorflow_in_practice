# Tensorflow In Practice Specialization

This repository contains the work and other tools for working through Cousera's Tensorflow in Practice Specialization. 

There is multiple ways to work with this repo: 

1. Using [Google Colabs tool](https://colab.research.google.com/notebooks/welcome.ipynb), an awesome free tool provided by Google to do Research & Development with notebooks.

2. [Docker containers](#Docker-Container-Setup) :) as I love using docker containers for almost everything I work with. I've created a set of tools you could use for your own projects apart from this one. 

## Docker Container Setup

 If you have: 
- GPU 
- Ubuntu / Debian Linux Distribution 

`./scripts/install-docker-nvidia.sh`

You should see an output like this if everything went well :) A table 

TODO: Add picture of output here

**Install docker container**

`docker build -f scripts/Dockerfile -t tf_practice_gpu .`

If you have: 
- CPU 
- Ubuntu / Debian Linux Distribution 

`docker build -f scripts/Dockerfile-cpu -t tf_practice_cpu .`

### Docker build arguments:
- `-f path_to_dockerfile`, pass the path to your dockerfile 
- `-t tag`, will set a tag to your image, in our case, tf_practice_gpu to be able to run the container that is only for gpu. 

## Starting your docker container

When I started building docker containers for everything, the idea was to spin it up those with the data I wanted :)

In this case, you will be able to run your container mounting any folder in the volume named as: `/data`

For example, Imagine you are going through lesson 1 of the specialization and you have a folder named: **l1_prog_paradigm**, running your container should be as easy as executing the following steps: 

```
# enter the folder 
cd l1_prog_paradigm

# Docker container run enabling GPUs :)
docker run --gpus all -it -p 8888:8888 -v $PWD:/data tf_practice_gpu
```
### Docker run arguments:

- `--gpus all`, enable all the gpus available
- `-it`, run the container as interactive mode
- `-p 8888:8888`, expose the ports to run jupyter from the browser
- `-v $PWD:/data`, mount your current directory ($PWD), into /data volume


## Starting your jupyter notebook

Boom :boom: , now you can start running jupyter locally. 

Go to [http://localhost:8888](http://localhost:8888)





