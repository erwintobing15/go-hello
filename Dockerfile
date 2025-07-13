FROM golang:1.24 AS build
WORKDIR /src
COPY <<EOF ./main.go
package main

import "fmt"

func main() {
  fmt.Println("hello, world")
}
EOF
RUN go build -o /bin/hello ./main.go

FROM scratch AS final
COPY --from=build /bin/hello /bin/hello
CMD ["/bin/hello"]