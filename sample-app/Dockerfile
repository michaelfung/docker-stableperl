# build a sample app: mojolicious lite web server
# example: docker build -f Dockerfile -t sample-app .

# run the app with:
# docker run -d -p 8081:3000 --name sample-app-test --mount source=sample-app,target=/app --mount source=perlbrew,target=/opt/perlbrew sample-app start

FROM rt:stable

WORKDIR /
COPY entrypoint.sh .

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
