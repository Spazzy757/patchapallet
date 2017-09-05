FROM nginx:stable
# Label Tangent
LABEL maintainer "brendan@tangentsolutions.co.za"
# Copy NGINX Config
COPY /build/nginx.conf /etc/nginx/nginx.conf
# Install NodeJS 6.x
RUN apt-get update && \
    apt-get -y install curl gnupg1 && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get -y install python build-essential nodejs git
# Copy Application Code
COPY . /opt/code
RUN chmod +x /opt/code/build/build.sh
# Build Application Code
WORKDIR /opt/code
RUN npm install -g gulp
RUN npm install && npm rebuild node-sass