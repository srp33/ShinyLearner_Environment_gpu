FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

####################################################################################
# Set environment variables
####################################################################################

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
ENV TZ=America/Denver

####################################################################################
# Download install scripts from non-gpu environment.
# Install and configure packages.
####################################################################################

RUN apt-get update && \
  apt-get install -y wget zip && \
  wget https://github.com/srp33/ShinyLearner_Environment/archive/master.zip && \
  unzip master.zip && \
  rm master.zip && \
  mv ShinyLearner_Environment-master/install*.sh . && \
  rm -rf ShinyLearner_Environment-master && \
  bash install_debian_packages.sh && \
  bash install_r_packages.sh && \
  sed -i "s|tensorflow|tensorflow_gpu|g" install_python_packages.sh && \
  bash install_python_packages.sh
