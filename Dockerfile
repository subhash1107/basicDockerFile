FROM ubuntu
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get upgrade -y && \
    apt-get install -y nodejs

COPY package.json package.json    
COPY package-lock.json package-lock.json    
COPY main.js main.js 

RUN npm install

CMD [ "node","main.js" ]