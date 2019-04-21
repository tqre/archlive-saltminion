#!/bin/bash
echo Minion initialization script starting...

echo "minion$(hostname -i)" > /etc/hostname

cat > /etc/salt/minion << EOF
master: $(cat /tmp/minion/master_ip)
id: $(hostname -i)

startup_states: sls

sls_list:
  - onconnect

EOF

echo Master IP is set to $(cat /tmp/minion/master_ip)
echo Minion ID is $(hostname -i)
echo Minion hostname is $(hostname)

echo Starting the salt-minion service...
systemctl start salt-minion
