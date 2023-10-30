FROM node:14       
COPY . /opt
WORKDIR /opt/
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
