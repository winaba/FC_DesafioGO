FROM golang:1.18-bullseye as base

WORKDIR $GOPATH/src/smallest-golang/app/ 

COPY . .

RUN go mod init hello-world
RUN go build -o /hello-world .

FROM scratch

WORKDIR /go

COPY --from=base /hello-world .

CMD ["./hello-world"]