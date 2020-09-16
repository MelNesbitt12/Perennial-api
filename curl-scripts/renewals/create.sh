#!/bin/bash

API="http://localhost:4741"
URL_PATH="/renewals"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "renewal": {
      "name": "'"${NAME}"'",
      "type": "'"${TYPE}"'",
      "date": "'"${DATE}"'",
      "url": "'"${URL}"'"
    }
  }'

echo
