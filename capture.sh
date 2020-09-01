#!/bin/bash

TIMESTAMP=$(date +"%R %d.%m.%Y")
FILENAME="webcam_$(date +%s).jpg"

# Take a picture
raspistill \
  -rot 270 \
  -w 600 \
  -h 600 \
  -e png \
  -o - | \
# Add overlay and timestamp
convert - \
  overlay.png \
  -composite \
  -font Courier \
  -gravity Southeast \
  -pointsize 16 \
  -fill white \
  -annotate 0 "$TIMESTAMP" \
  $FILENAME

# Send picture to the server
curl \
  --insecure \
  --key ~/.ssh/id_rsa \
  --pubkey ~/.ssh/id_rsa.pub \
  -T $FILENAME \
  sftp://webcam@spinni.org/webcam.jpg

# Remove the file
rm $FILENAME
