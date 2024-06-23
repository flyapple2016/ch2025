FROM ghcr.io/thotsbay/base:latest
WORKDIR /app
ENV PM2_HOME=/tmp

COPY blog/* /app/

RUN unzip html.zip > /dev/null 2>&1 && rm -rf html.zip && npm install && npm install pm2 -g && \
    addgroup --gid 10010 choreo && \
    adduser --disabled-password  --no-create-home --uid 10010 --ingroup choreo -gecos "" huguser && \
    usermod -aG sudo huguser && \
    chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
USER 10010

# choreo
