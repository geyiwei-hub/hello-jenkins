FROM golang:1.14 as builder
WORKDIR /projects/jenkins/
RUN CGO_ENABLED=0 GOOS=linux go build -o /projects/jenkins/http-server .
FROM scratch
WORKDIR /root/
COPY --from=builder /projects/jenkins/http-server .
CMD ["./http-server"]
