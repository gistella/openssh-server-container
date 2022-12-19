FROM registry.access.redhat.com/ubi8/ubi-minimal:8.7

ENV PORT 2222

EXPOSE ${PORT}

COPY entrypoint.sh .

RUN microdnf install openssh openssh-server && \
	chmod +x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh
