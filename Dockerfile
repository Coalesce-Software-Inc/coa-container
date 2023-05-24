# dockerfile for coa refresh

FROM alpine:3.16.0 as base

RUN apk add --update npm git
RUN npm install -g @coalescesoftware/coa

WORKDIR /coalesce

ARG ARGS

COPY ./entrypoint.sh .
RUN chmod 700 entrypoint.sh 

ENTRYPOINT ["/bin/sh", "-c", "/coalesce/entrypoint.sh"]
