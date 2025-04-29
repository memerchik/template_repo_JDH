# Dockerfile

# 1. Base with Jupyter server
FROM jupyter/minimal-notebook:latest

# 2. Switch to root to install extra packages
USER root

# 3. Install Python deps (replace with your own)
RUN pip install --no-cache-dir \
        numpy \
        pandas \
        matplotlib \
        scikit-learn

# 4. Copy your notebooks (and any data/code) into the image
COPY . /home/jovyan/project

# 5. Fix permissions and switch back
RUN chown -R jovyan:users /home/jovyan/project
USER jovyan

# 6. Set the working directory inside the container
WORKDIR /home/jovyan/project

# 7. (Optional) Expose port if you want to run it standalone
EXPOSE 8888
