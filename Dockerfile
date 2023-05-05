FROM node:14.16.0

RUN apt-get update && apt-get install -y openssh-client

WORKDIR /godmode

COPY . .

RUN npm install

EXPOSE 3088

ENV PATH="$PATH:/usr/bin"
ENV HOST=0.0.0.0
ENV NODE_ENV=production
ENV PORT=3088

RUN npm run build

CMD [ "npm", "run", "start" ]
