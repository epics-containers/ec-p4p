#!/bin/bash

# IP lists for IOCS (blank if get_ioc_ips.py fails)
export IPS="$(python3 /config/get_ioc_ips.py)"
export EPICS_PVA_ADDR_LIST=${IPS:-127.0.0.1}
export EPICS_CA_ADDR_LIST=${IPS:-127.0.0.1}

# PORTS for CA and PVA
export CA_SERVER_PORT=${CA_SERVER_PORT:-5064}
export PVA_SERVER_PORT=${PVA_SERVER_PORT:-5075}

# DEBUGGING
CA_DEBUG=${CA_DEBUG:-0}
PVA_DEBUG=${PVA_DEBUG:-0}

# background the CA Gateway
/epics/ca-gateway/bin/linux-x86_64/gateway -sport ${CA_SERVER_PORT} -cip "${EPICS_CA_ADDR_LIST}" -pvlist /config/pvlist -access /config/access -log /dev/stdout -debug ${CA_DEBUG:-0}