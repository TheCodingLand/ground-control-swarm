
# Stage 1 - the build process
#FROM node:alpine as build-deps
FROM node:alpine
ARG COMMIT

ARG REPO=https://github.com/rLoopTeam/react-groundstation-v2

WORKDIR /usr/src/app
RUN apk add git


RUN git clone ${REPO} .
RUN git checkout 228986128b053dc0869981f5278124475f6f6c9a


#COPY package.json package-lock.json ./
COPY config.js ./src/commConfig.js
RUN npm i
#ADD . /usr/src/app
RUN npm run build
#RUN mkdir scripts
#RUN wget https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js
RUN npm run build  
CMD npm run start-all
# Stage 2 - the production environment
#FROM nginx:alpine
#COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
#ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]