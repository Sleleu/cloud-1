FROM python:3.13.5-slim

ARG CONTROL_NODE=control-node
ARG HOST_IP
ARG HOST_USER

ENV HOST_IP=${HOST_IP}
ENV HOST_USER=${HOST_USER}

RUN apt-get install -y                      \
    && apt-get update -y                    \
    && apt-get install -y   openssh-client  \
                            openssh-server  \
                            vim             \
                            less            \
    && pip install ansible-core==2.18.7     \
    && useradd --create-home ${CONTROL_NODE}

WORKDIR /home/${CONTROL_NODE}

COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} ./files /home/${CONTROL_NODE}/files
COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} ./inventory /home/${CONTROL_NODE}/inventory
COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} ansible.cfg /home/${CONTROL_NODE}
COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} cloud1.pem /home/${CONTROL_NODE}

RUN echo "test ${HOST_IP}" > /home/control-node/test
RUN echo "tsdasd" > /home/control-node/test2

EXPOSE 22

USER ${CONTROL_NODE}
