# FROM jupyter/minimal-notebook:latest


# IMPORTANT: Specify the Python version you need your notebook to run on in the line below. If you don't know the exact version, do your best to find the best one or use the line above instead of the one below (may result errors in the future)

FROM jupyter/minimal-notebook:python-3.9

USER root

# Installing Python dependencies (you can replace these with the ones you need with OR without specifying the verison as in the template below). It is recommended to specify versions in order to avoid errors in future
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
