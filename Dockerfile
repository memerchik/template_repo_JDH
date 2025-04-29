# 1. Base with Jupyter server
# FROM jupyter/minimal-notebook:latest

# --------
# Use the line below instead of the one above in case you need a specific Python version to run the article.
# --------
FROM jupyter/minimal-notebook:python-3.9

USER root

# Installing Python dependencies (you can replace these with the ones you need with OR without specifying the verison as in the template below)
RUN pip install --no-cache-dir \
      numpy==1.23.5 \
      pandas==1.4.2 \
      matplotlib \
      scikit-learn==1.1.2
COPY . /home/jovyan/project

RUN chown -R jovyan:users /home/jovyan/project
USER jovyan


WORKDIR /home/jovyan/project

EXPOSE 8888
