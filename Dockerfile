FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# TEST: no non-root USER and no HEALTHCHECK.
CMD ["node", "src/server.js"]
