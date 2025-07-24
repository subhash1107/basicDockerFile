# Docker file

We can directly use node image for building this app but here we have focussed on building from scratch using core os - using ubuntu image.

- FROM ubuntu
    - This line tells the docker to take the base image which we are going to use in our file.

- RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get upgrade -y && \
    apt-get install -y nodejs

    - All of these code will run on ubuntu the \ backslash used here to include the lines in same where:-
        - In starting we have ran command to update the os if available and then install the curl to install node.

- COPY package.json package.json    
    - We are copying the package.json file in the docker with the same name at same path. It will help us to install the dependencies we need to run our app.

- COPY package-lock.json package-lock.json    
    - Same here we are copying package-lock.json file that will be used for devDependencies.

- COPY main.js main.js 
    - Here the main server file that is main.js is being copied.

- RUN npm install
    - After the whole process this command will be run to install the dependencies.

- CMD [ "node","main.js" ]
    - This command will be run to start the server.