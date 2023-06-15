FROM node:14

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python2 \
    python3 \
    libtool \
    autoconf \
    automake \
    g++ \
    pkg-config \
    curl \
    nginx \
    postgresql \
    postgresql-contrib \
    postfix \
    letsencrypt \
    certbot \
    dovecot-core \
    dovecot-imapd \
    dovecot-lmtpd \
    opendkim \
    opendkim-tools

RUN echo 'export PATH=/usr/lib/postgresql/13/bin:$PATH' >> ~/.bashrc

# Set up the environment variables
ENV NODE_ENV=production
ENV PORT=80

# Install Wild Duck
RUN git clone https://github.com/sovereign/sovereign.git
WORKDIR /workspace/sovereign
RUN npm install -g yarn
RUN yarn install --production --frozen-lockfile

# Expose the necessary ports
EXPOSE 80

CMD ["npm", "start"]
