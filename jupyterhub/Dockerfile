FROM jupyter/jupyterhub
MAINTAINER Timothy Hnat twhnat@memphis.edu


RUN pip install --upgrade jupyterhub
RUN pip install jupyter


COPY jupyterhub_config.py /

CMD jupyterhub --no-ssl -f /jupyterhub_config.py