FROM node:10-slim

ARG OPENKB_VER=master

WORKDIR /openkb

# Install
RUN apt-get update \
 && apt-get install -y git python gcc g++ make \
 && git clone https://github.com/esultohub/openkb.git -b ${OPENKB_VER} --depth 1 /repo \
 && mv -T /repo/sources /openkb \
 && rm -r /repo \
 && cd /openkb \
 && cp config/config.json config.org.json \
 && npm install \
 && apt-get purge -y git python gcc g++ make \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# For minify
RUN npm run uglify
ENV NODE_ENV="production node app.js"

# Copy assets
COPY ./assets/startup.sh /openkb/startup.sh

EXPOSE 4444

CMD ["bash", "/openkb/startup.sh"]
