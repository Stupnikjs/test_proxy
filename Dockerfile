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

 

# Build the Go application
RUN go build -o main ./cmd
# Specify the command to run when the container starts

EXPOSE $PORT 


RUN go install github.com/GoogleCloudPlatform/cloud-sql-proxy/v2@latest

CMD [ "cloud_sql_proxy", "-instances=${INSTANCE}" , "-credential_file=/credentials.json", "&", "./main" ]
