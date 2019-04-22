#!/bin/bash
echo Minion initialization script starting...

hostname minion@$(hostname -i)

cat > /etc/salt/minion << EOF
master: $(cat /tmp/minion/master_ip)
id: $(hostname)
startup_states: sls

sls_list:
  - onconnect

EOF

echo Master IP is set to $(cat /tmp/minion/master_ip)
echo Minion ID is $(hostname)

echo Starting the salt-minion service...
systemctl start salt-minion
