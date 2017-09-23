# build a sample app: mojolicious lite web server
# example: docker build -t sample-app:1.0 .
# run the app with:
# docker run -d -p 8080:3000 -v /opt/docker-vols/sample-app:/app sample-app:1.0 start

FROM stableperl-rt:1.0 

#USER daemon
WORKDIR /app
COPY entrypoint.sh .
COPY myweb.pl .

VOLUME ["/app"]

ENV APP_PORT=3000 \
    MOJO_MODE=production

EXPOSE $APP_PORT

ENTRYPOINT ["./entrypoint.sh"]
CMD ["start"]
