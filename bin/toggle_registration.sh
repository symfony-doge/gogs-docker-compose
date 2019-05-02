#!/usr/bin/env bash

INI_FILE=./data/app/gogs/conf/app.ini

# Adds parameter if it not exists.
if ! grep -q 'DISABLE_REGISTRATION' ${INI_FILE}; then
    sed -i -E '/\[service\]/a DISABLE_REGISTRATION = false' ${INI_FILE}
    echo "Added 'DISABLE_REGISTRATION = false' to ${INI_FILE}"
fi

# Changes parameter from "false" to "true".
if grep -q 'DISABLE_REGISTRATION.*=.*false' ${INI_FILE}; then
    sed -i -E "s/DISABLE_REGISTRATION.*=.*/DISABLE_REGISTRATION = true/g" ${INI_FILE}
    echo "Changed 'DISABLE_REGISTRATION' to 'true' in ${INI_FILE} (restart is required)"
    exit 1
fi

# Changes parameter from "true" to "false".
if grep -q 'DISABLE_REGISTRATION.*=.*true' ${INI_FILE}; then
    sed -i -E "s/DISABLE_REGISTRATION.*=.*/DISABLE_REGISTRATION = false/g" ${INI_FILE}
    echo "Changed 'DISABLE_REGISTRATION' to 'false' in ${INI_FILE} (restart is required)"
    exit 1
fi
