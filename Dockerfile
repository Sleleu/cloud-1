FROM python:3.13.5-slim

ARG CONTROL_NODE=control-node

RUN apt-get install -y                      \
    && apt-get update -y                    \
    && apt-get install -y openssh-client    \
    && pip install ansible-core==2.18.7     \
    && useradd --create-home ${CONTROL_NODE}

WORKDIR /home/${CONTROL_NODE}

COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} ./inception /home/${CONTROL_NODE}/inception

USER ${CONTROL_NODE}