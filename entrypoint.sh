#!/bin/bash

useradd "${USER_NAME}"
mkdir "/home/${USER_NAME}/.ssh"

curl -q "${PUBKEYS_URL}" -o "/home/${USER_NAME}/.ssh/authorized_keys"

chmod 700 "/home/${USER_NAME}/.ssh"
chmod 600 "/home/${USER_NAME}/.ssh/authorized_keys"
chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.ssh

/bin/ssh-keygen -A
/sbin/sshd -D -p "${PORT}"
