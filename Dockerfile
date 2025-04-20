FROM node:18-alpine

# 1) Set working dir
WORKDIR /home/node/app

# 2) Copy only package files as root
COPY package*.json ./

# 3) Give node ownership of everything in the app dir
RUN chown -R node:node /home/node/app

# 4) Switch to node, now that permissions are correct
USER node

# 5) Install deps (package*.json owned by node)
RUN npm install

# 6) Copy the rest of your code as node
COPY --chown=node:node . .

EXPOSE 1234
CMD ["npm", "start"]
