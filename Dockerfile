FROM golang:bullseye AS build

RUN go install github.com/DarthSim/overmind/v2@latest
RUN go install github.com/thesephist/oak@latest

FROM debian:bullseye AS runner
RUN apt-get update && \
    apt-get install -y \
    bash \
    tmux \
    curl \
    apache2-utils \
    nginx


RUN mkdir /app
WORKDIR /app
COPY . /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY htpasswd /etc/nginx/.htpasswd
COPY --from=build /go/bin/overmind /app/overmind
COPY --from=build /go/bin/oak /app/oak
EXPOSE 22
EXPOSE 80
CMD ["/app/overmind", "start"]
