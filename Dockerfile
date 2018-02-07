FROM mcuadros/golang-arm:1.8-0-alpine

MAINTAINER Andrej Antas <andrej@antas.cz>

RUN apk --no-cache add git
RUN go get github.com/maklesoft/padlock-cloud

ENTRYPOINT  padlock-cloud --notify-errors ${NOTIFY_EMAIL}  --db-path=/padlock-db --email-server ${MAIL_SERVER}\
    --email-port ${MAIL_PORT} --email-user ${MAIL_USER} --email-password ${MAIL_PASSWORD}\
    runserver --cors --base-url ${BASE_URL}
