FROM ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install ffmpeg, nginx, nginx-rtmp module
RUN apt-get update && \
    apt-get install -y ffmpeg nginx libnginx-mod-rtmp

# Forward logs to Docker
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Set up config file
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 1935
CMD ["nginx", "-g", "daemon off;"]
