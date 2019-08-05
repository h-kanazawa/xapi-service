FROM eu.gcr.io/learninglocker-dev/xapi-service.build

WORKDIR /xapi-service

COPY dist /xapi-service/dist/
COPY pm2 /xapi-service/pm2/
COPY .env package.json /xapi-service/

EXPOSE 8081

CMD ["pm2-runtime", "start", "pm2/xapi.json"]
