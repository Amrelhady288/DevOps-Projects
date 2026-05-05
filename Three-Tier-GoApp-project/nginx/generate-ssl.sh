#!/bin/bash

# Script to generate self-signed SSL certificates for nginx

# Generate private key and certificate
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

echo "SSL certificates generated successfully!"
echo "Private key: key.pem"
echo "Certificate: cert.pem"