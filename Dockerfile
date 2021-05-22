#Build Phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase 
FROM nginx
#Copy data from build phase present in /app/build and put it into /usr/share/nginx/html(we always put it here only)
COPY --from=0 /app/build /usr/share/nginx/html
#Note that we dont need the run command. On starting the nginx, nginx takes care of running it. 

#End of Dockerfile