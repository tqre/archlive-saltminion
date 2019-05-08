#!/bin/bash
echo Minion initialization script starting...

# Set minion hostname to last digits of it's IP address
hostnamectl --static set-hostname min-$(hostname -i | sed 's/.*[.]//')

# Make salt configuration file
cat > /etc/salt/minion << EOF
master: $(cat /tmp/minion/master_ip)
id: $(hostname)
startup_states: sls

sls_list:
  - onconnect

EOF

systemctl start salt-minion
