FROM  node:16

RUN mkdir /project
WORKDIR /project

COPY . .

RUN npm install -g @angular/cli
RUN npm install
RUN npm run build



from nginx:alpine
COPY --from=node /project/dist/onescmfe /usr/share/nginx/html
EXPOSE 8080
