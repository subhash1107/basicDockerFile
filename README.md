# Docker file (Building Image and uploading to docker hub)

---

## File

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

    ---

## Building Image to local

- docker build -t nodeapp
    - Here this -t flag is being used to give tag to the image mean name.

    ---

## Running on the local

-   docker run -it -p 9000:9000 --name localNodeContainer nodeapp
    - -p flag is being used for port mapping to our local port.
    - -it flag is being used for running the container in interactive mode with the root terminal in docker container.
    - --name flag is used to assign name to the container if not assigned the docker will assign it a random name.
    - We can use -e flag and the followed by different environment variable if used in your app as it does not need to configure .env file.

Let suppost the container is stopped then we can restart the container and this time we will not use run command as this is only used when we have to create a new container now we will run:-

- docker start localNodeContainer 
    - This will start the container if stopped and we not have to do port mapping all the time.

- docker start -ai localNodeContainer
    - This -ai flag is used to start container in interactive attach mode that will directly make you enter in that process terminal in which your app is running.

Let suppose you don't want to run that terminal instead you want to run another process then you can use execute command   

- docker exec -it localNodeContainer bash
    - Here we have told to run the container in execute mode with interaction with the root in bash.

    ---

## Creating Image on docker hub.

First of all keep dome points in mind before pushing image to docker hub.

- You should have an account on docker hub.
- It must be logged in on your local terminal from where you are pushing that code.
    - docker login
        - username 
        - password
- After a successful login now keep two thing in your mind.
    - Create a repository on the hub its your choice to prefer creating public or private repo.
    - The tagname showed there followed by your username, the whole name should you use while making the build of the image.

- Now you are ready to push your image to the hub.

- docker run imageTagName.

---


Following all steps above it is sure you will create image of your basic node application.