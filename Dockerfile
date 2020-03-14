FROM tensorflow/tensorflow:2.0.1-gpu-py3-jupyter

RUN  apt update \
  && apt install --no-install-recommends -y \
     ca-certificates-java \
     git \
     npm \
     openjdk-8-jre-headless \
  && apt autoclean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /usr/share/locale/* /usr/share/man/* /usr/share/doc/*

# Spark
ENV APACHE_SPARK_VERSION=3.0.0-preview2 \
    HADOOP_VERSION=2.7
RUN  mkdir /usr/local/spark \
  && curl 'http://mirror.easyname.ch/apache/spark/spark-${APACHE_SPARK_VERSION}/spark-${APACHE_SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz' \
  |  tar -xzf - -C /usr/local/spark --strip 1

ENV  SPARK_HOME=/usr/local/spark
ENV  PATH=${SPARK_HOME}/bin:${PATH}

COPY requirements.txt /tmp/requirements.txt
RUN  pip install --no-cache -r /tmp/requirements.txt

ENV  NODE_OPTIONS=--max-old-space-size=4096
RUN  jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build \
  && jupyter labextension install @jupyterlab/git --no-build \
  && jupyter labextension install @jupyterlab/toc --no-build \
  && jupyter labextension install ipysheet --no-build \
  && jupyter labextension install jupyter-leaflet --no-build \
  && jupyter labextension install jupyterlab-drawio --no-build \
  && jupyter labextension install jupyterlab_bokeh --no-build \
  && jupyter labextension install jupyterlab-plotly --no-build \
  && jupyter labextension install plotlywidget --no-build \
  && jupyter labextension install @ryantam626/jupyterlab_code_formatter --no-build \
  && pip install jupyterlab_code_formatter \
  && jupyter serverextension enable --py jupyterlab_code_formatter \
  && jupyter lab build
ENV  NODE_OPTIONS=

# SPARK
# https://github.com/jupyter/docker-stacks/blob/master/pyspark-notebook/Dockerfile

RUN  useradd -u 1000 -U -m workspace
USER workspace
WORKDIR /home/workspace

COPY check_installation.ipynb .
