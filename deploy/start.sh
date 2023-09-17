#!/bin/sh
usage() {
  echo "Managment script"
  echo "usage: $0 -p <playbook>"
  echo "Commands:"
  echo "  start         Create solution."
  echo "  update        Update app at node."
}
if [ $# -eq 0 ]; then
  usage
  exit 0
fi
while getopts ":p:" opt; do
  case "$opt" in
    p)
      playbook="$OPTARG"
      ;;
  esac
done

if [ -z "$playbook" ]; then
  usage
  exit 0
fi

if [ "$playbook" = "start" ]; then
  ansible-playbook "$playbook.yml" \
  i inventory/hosts \
  -vv
fi

if [ "$playbook" = "update" ]; then
# work under command line. need testing under script
# export ANSIBLE_HOSTS=$PWD/dinventory/ec2.py
# export EC2_INI_PATH=$PWD/dinventory/ec2.ini
# ansible-playbook "$playbook.yml" \
# -u ec2-user \
# -e "node=us-east-1" \
# --become
# -vv
fi