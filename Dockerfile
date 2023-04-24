#Primeira Imagem do GOlang
FROM golang:1.18 as builder
#ENV CGO_ENABLED=1 GOOS=linux GOARCH=amd64 GO111MODULE=on
WORKDIR /app
COPY . .
RUN go mod init main
RUN go build main.go

#Segunda Imagem (com tamanho reduzido)
FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["./main"]