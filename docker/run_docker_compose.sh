#!/usr/bin/env bash


gpg --decrypt ../../woofs_projects/cred.json.gpg > /tmp/config.json
# jq -r "to_entries|...|.[]" your_env_file.json parses the JSON file, converting it into a list of key=value pairs. The to_entries function converts the JSON object into key/value pairs, map(...) transforms each pair into a string, and the -r option makes the output raw (without quotes).
# while IFS="=" read -r key value; do ...; done reads each key=value pair, splitting them on the = sign, and then exports them as environment variables.
while IFS="=" read -r key value; do export "$key=$value"; done < <(jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" /tmp/config.json)
rm /tmp/config.json


docker compose up -d
# we don't actually need to do this but it's
# nice to see which variables are being used
# docker compose \
# -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
# -e JWT_SECRET="$JWT_SECRET" \
# -e ANON_KEY="$ANON_KEY" \
# -e SERVICE_ROLE_KEY="$SERVICE_ROLE_KEY" \
# -e DASHBOARD_USERNAME="$DASHBOARD_USERNAME" \
# -e DASHBOARD_PASSWORD="$DASHBOARD_PASSWORD" \
# -e POSTGRES_HOST="$POSTGRES_HOST" \
# -e POSTGRES_DB="$POSTGRES_DB" \
# -e POSTGRES_PORT="$POSTGRES_PORT" \
# -e KONG_HTTP_PORT="$KONG_HTTP_PORT" \
# -e KONG_HTTPS_PORT="$KONG_HTTPS_PORT" \
# -e PGRST_DB_SCHEMAS="$PGRST_DB_SCHEMAS" \
# -e SITE_URL="$SITE_URL" \
# -e ADDITIONAL_REDIRECT_URLS="$ADDITIONAL_REDIRECT_URLS" \
# -e JWT_EXPIRY="$JWT_EXPIRY" \
# -e DISABLE_SIGNUP="$DISABLE_SIGNUP" \
# -e API_EXTERNAL_URL="$API_EXTERNAL_URL" \
# -e MAILER_URLPATHS_CONFIRMATION="$MAILER_URLPATHS_CONFIRMATION" \
# -e MAILER_URLPATHS_INVITE="$MAILER_URLPATHS_INVITE" \
# -e MAILER_URLPATHS_RECOVERY="$MAILER_URLPATHS_RECOVERY" \
# -e MAILER_URLPATHS_EMAIL_CHANGE="$MAILER_URLPATHS_EMAIL_CHANGE" \
# -e ENABLE_EMAIL_SIGNUP="$ENABLE_EMAIL_SIGNUP" \
# -e ENABLE_EMAIL_AUTOCONFIRM="$ENABLE_EMAIL_AUTOCONFIRM" \
# -e SMTP_ADMIN_EMAIL="$SMTP_ADMIN_EMAIL" \
# -e SMTP_HOST="$SMTP_HOST" \
# -e SMTP_PORT="$SMTP_PORT" \
# -e SMTP_USER="$SMTP_USER" \
# -e SMTP_PASS="$SMTP_PASS" \
# -e SMTP_SENDER_NAME="$SMTP_SENDER_NAME" \
# -e ENABLE_PHONE_SIGNUP="$ENABLE_PHONE_SIGNUP" \
# -e ENABLE_PHONE_AUTOCONFIRM="$ENABLE_PHONE_AUTOCONFIRM" \
# -e STUDIO_DEFAULT_ORGANIZATION="$STUDIO_DEFAULT_ORGANIZATION" \
# -e STUDIO_DEFAULT_PROJECT="$STUDIO_DEFAULT_PROJECT" \
# -e STUDIO_PORT="$STUDIO_PORT" \
# -e SUPABASE_PUBLIC_URL="$SUPABASE_PUBLIC_URL" \
# -e IMGPROXY_ENABLE_WEBP_DETECTION="$IMGPROXY_ENABLE_WEBP_DETECTION" \
# -e FUNCTIONS_VERIFY_JWT="$FUNCTIONS_VERIFY_JWT" \
# -e LOGFLARE_LOGGER_BACKEND_API_KEY="$LOGFLARE_LOGGER_BACKEND_API_KEY" \
# -e LOGFLARE_API_KEY="$LOGFLARE_API_KEY" \
# -e DOCKER_SOCKET_LOCATION="$DOCKER_SOCKET_LOCATION" \
# -e GOOGLE_PROJECT_ID="$GOOGLE_PROJECT_ID" \
# -e GOOGLE_PROJECT_NUMBER="$GOOGLE_PROJECT_NUMBER" \
#        up -d
