# Base image
FROM node:18.18.2

# Set working directory
WORKDIR /app

# # Install dependencies
# COPY package.json ./
# COPY yarn.lock ./
# RUN yarn install --frozen-lockfile

# # Add app
# COPY . ./

# # Start app
# CMD ["yarn", "start"]

RUN apt update -y && \
    apt install -y \
        awscli \
        zip \
        less \
        && \
    apt clean all

# Run AWS initialization script
COPY init-aws.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init-aws.sh
