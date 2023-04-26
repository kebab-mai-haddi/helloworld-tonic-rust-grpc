# Use a pre-built image with the Rust compiler and necessary build tools installed
FROM rust:1.69.0 AS build

# Install protobuf dependencies
RUN apt-get update
RUN apt install -y protobuf-compiler
# Change workdir
WORKDIR /helloworld-tonic

# Copy the source code to the container
COPY . .

# Expose the port that the web app listens on
EXPOSE 50051

# Build the web app
# RUN cargo build --release

CMD ["cargo", "run", "--bin", "helloworld-server"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]