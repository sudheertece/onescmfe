FROM  node:16 AS node



RUN npm cache clean --force

COPY . .

RUN npm install -g @angular/cli
RUN npm install
RUN npm run build



from nginx:alpine
RUN  echo ${WORKDIR}
COPY --from=node dist/oescmfe/* /usr/share/nginx/html/
COPY /nginx.conf  /etc/nginx/conf.d/default.conf
EXPOSE 80
