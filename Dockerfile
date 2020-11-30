FROM golang:1.14 as builder
WORKDIR /root/projects/jenkins/
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o ./http-server .
FROM scratch
WORKDIR /root/projects
COPY --from=builder /root/projects/jenkins/http-server .
CMD ["./http-server"]
