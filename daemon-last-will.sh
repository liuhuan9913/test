#!/bin/sh

app_name="hello.sh"
mqtt_host="127.0.0.1"
mqtt_port="1883"
mqtt_user="admin"
mqtt_password="admin"
mqtt_topic="hello/leave"
mqtt_qos="1"

while true; do
    mosquitto_sub -h ${mqtt_host} -p ${mqtt_port} -u ${mqtt_user} -P ${mqtt_password} -t ${mqtt_topic} -q ${mqtt_qos} -C 1
    echo "${app_name} was lost, kill ${app_name}"
    killall -9 ${app_name}
    sleep 10s
done
