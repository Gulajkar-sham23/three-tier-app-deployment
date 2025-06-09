#!/bin/bash
echo "Rolling back to previous version..."
docker image rm mywebapp:latest
