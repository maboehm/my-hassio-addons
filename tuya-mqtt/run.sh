#!/usr/bin/with-contenv bashio
set -e

bashio::log.level "$(bashio::config 'log_level')"

config="$(bashio::config 'tuya_mqtt_config')"
if bashio::config.true 'discover_mqtt_broker'; then
    bashio::log.info "auto discovery enabled"
    # MQTT_HOST="test"
    # MQTT_PORT="1234"
    MQTT_HOST=$(bashio::services mqtt "host")
    MQTT_PORT=$(bashio::services mqtt "port")
    MQTT_USER=$(bashio::services mqtt "username")
    MQTT_PASSWORD=$(bashio::services mqtt "password")
    bashio::log.info "Discovered Broker at ${MQTT_HOST}"
    query=$(cat <<QUERY
        .host = "${MQTT_HOST}" |
        .port = "${MQTT_PORT}" |
        .mqtt_user = "${MQTT_USER}" |
        .mqtt_pass = "${MQTT_PASSWORD}"
QUERY
)
    config="$(bashio::jq "${config}" "${query}")"
fi
echo "$config" > ./config.json
bashio::log.debug "loaded config: $(cat ./config.json)"

echo "$(cat /data/options.json | jq --raw-output -c -M .tuya_mqtt_devices)" > ./devices.conf
bashio::log.debug "loaded devices: $(cat ./devices.conf)"

if bashio::debug; then
    export DEBUG=tuya-mqtt:*
fi

bashio::log.info "Launching MQTT Wrapper. With the following devices: $(cat ./devices.conf | jq [.[].name])"
node tuya-mqtt.js
