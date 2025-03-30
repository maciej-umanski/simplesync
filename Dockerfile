FROM alpine:latest

RUN apk add --no-cache rsync

WORKDIR /app

COPY sync.sh /app/sync.sh
COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/sync.sh /app/entrypoint.sh

RUN mkdir /source
RUN mkdir /target
RUN mkdir /backup
RUN mkdir /logs

ENV CRON_SCHEDULE="0 */3 * * *"

ENTRYPOINT ["/app/entrypoint.sh"]
