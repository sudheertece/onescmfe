FROM  node:16 AS node

RUN mkdir /dist/src/app
WORKDIR /dist/src/app

RUN npm cache clean --force

COPY . .

RUN npm install -g @angular/cli
RUN npm install
RUN npm run build



from nginx:alpine
RUN  echo ${WORKDIR}
COPY --from=node /dist/src/app/* /usr/share/nginx/html/
COPY /nginx.conf  /etc/nginx/conf.d/default.conf
EXPOSE 80
