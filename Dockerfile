FROM eu.gcr.io/learninglocker-dev/xapi-service.build

WORKDIR /xapi-service

RUN ls

RUN rm -r /xapi-service/*

RUN ls

COPY dist /xapi-service/dist/
COPY pm2 /xapi-service/pm2/
COPY .env package.json /xapi-service/
COPY node_modules /xapi-service/node_modules/

RUN ls

EXPOSE 8081

CMD ["start"]
