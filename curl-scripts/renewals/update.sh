#!/bin/bash

API="http://localhost:4741"
URL_PATH="/renewals"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "renewal": {
      "name": "'"${NAME}"'",
      "type": "'"${TYPE}"'",
      "date": "'"${DATE}"'",
      "cost": "'"${COST}"'",
      "autoRenew": "'"${AUTORENEW}"'",
      "url": "'"${URL}"'",
      "instructions": "'"${INSTRUCTIONS}"'"
    }
  }'

echo
