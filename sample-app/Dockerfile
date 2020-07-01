# build a sample app: mojolicious lite web server
# example: docker build -f Dockerfile -t sample-app .
# example: docker build -t sample-app .

# run the app with:
# docker run -d -p 8081:3000 --name sample-app-test
#  --mount source=perlbrew,target=/opt/perlbrew \
#  --mount source=sample-app,target=/app \
#  sample-app start

FROM rt:buster

WORKDIR /
COPY entrypoint.sh .

RUN adduser --disabled-password --disabled-login --gecos "app user" --home /app app
USER app
WORKDIR /app
COPY myweb.pl .

#
# setup app listen port
#
ENV APP_PORT=3000
EXPOSE $APP_PORT

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]

VOLUME ["/app"]
VOLUME ["/opt/perlbrew"]
