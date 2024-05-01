FROM golang:1.22-alpine
WORKDIR /app




ENV INSTANCE=celestial-tract-421819:europe-west9:pharmagorun


COPY go.mod .
COPY go.sum .

# Download all dependencies
RUN go mod download
# Copy the source code into the container
COPY ./credentials.json /credentials.json
COPY . .

RUN wget https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.11.0 -o /usr/local/bin/cloud_sql_proxy
RUN chmod+x /usr/local/bin/cloud_sql_proxy

# Build the Go application
RUN go build -o main .
# Specify the command to run when the container starts

EXPOSE $PORT 




CMD [ "/usr/local/bin/cloud_sql_proxy", "-instances=${INSTANCE}" , "-credential_file=/credentials.json", "&", "./main" ]
