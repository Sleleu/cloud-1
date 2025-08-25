FROM python:3.13.5-slim

ARG CONTROL_NODE=control-node

RUN apt-get install -y                      \
    && apt-get update -y                    \
    && apt-get install -y   openssh-client  \
                            vim             \
                            less            \
    && pip install  ansible-core==2.18.7    \
                    awscli==1.42.16         \
                    boto3==1.40.16          \
    && useradd --create-home ${CONTROL_NODE}

WORKDIR /home/${CONTROL_NODE}

COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} ./files files
COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} ./inventory inventory
COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} ansible.cfg .
COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} cloud1.pem .
COPY --chown=${CONTROL_NODE}:${CONTROL_NODE} entrypoint.sh .

EXPOSE 22

USER ${CONTROL_NODE}

ENTRYPOINT [ "bash", "entrypoint.sh" ]