#!/bin/bash

# Set minion hostname to last digits of it's IP address
hostnamectl --static set-hostname min-$(hostname -i)

# Make salt configuration file
cat > /etc/salt/minion << EOF
master: $(cat /tmp/minion/master_ip)
id: $(hostname)
startup_states: sls

sls_list:
  - onconnect

EOF

# Start the service
systemctl start salt-minion
