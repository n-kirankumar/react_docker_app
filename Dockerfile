# Step 1: Build React with esbuild
FROM node:18 AS build

WORKDIR /app

# install esbuild (fast bundler) + react
RUN npm init -y && npm install react react-dom esbuild

# copy our App.jsx
COPY App.jsx .

# bundle React app into plain JS
RUN npx esbuild App.jsx --bundle --outfile=bundle.js --format=esm

# Step 2: Serve with Nginx
FROM nginx:alpine

# create index.html that loads bundle.js
RUN echo '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>React App</title></head><body><div id="root"></div><script type="module" src="bundle.js"></script></body></html>' > /usr/share/nginx/html/index.html

# copy bundle from build stage
COPY --from=build /app/bundle.js /usr/share/nginx/html/bundle.js

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
