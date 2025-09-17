# Use a minimal base image
FROM alpine:3.19

# Set working directory
WORKDIR /pb

# Install curl to fetch PocketBase release
RUN apk add --no-cache curl unzip

# Download PocketBase (adjust version if needed)
ENV PB_VERSION=0.22.8
RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

# Expose PocketBase default port
EXPOSE 8090

# Run PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb/data"]
