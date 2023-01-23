FROM  node:16

RUN mkdir /project
WORKDIR /project

COPY . .

RUN npm install -g @angular/cli
RUN npm build --prod



from nginx:alpine
COPY --from=node project/dist/onescmfe /usr/share/nginx/html
EXPOSE 8080
