#!/bin/bash
# (C) 2019 Tuomo Kuure, GPL 3
echo Minion initialization script starting...

cat > /etc/salt/minion << EOF
master: <ip address>
id: <minion name>
EOF

echo Starting the salt-minion service...
systemctl start salt-minion
