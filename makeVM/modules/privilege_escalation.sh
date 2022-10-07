#!/usr/bin/env bash                                                             

vboxmanage startvm "HTW-Injectable" --type headless
echo "Waiting for VM to come up..."
sleep 8

USER_DIR_NAME="mario"

scp -P 2200 -i ${TMPDIR}/rootkey -r modules/resources/privilege_escalation root@127.0.0.1:/home/${USER_DIR_NAME}/
ssh -p 2200 -i ${TMPDIR}/rootkey root@127.0.0.1 "cd /home/${USER_DIR_NAME}/privilege_escalation && bash setup.sh"

