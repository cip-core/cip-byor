#!/bin/bash

###
# Saving relevant content for debugging, if needed.

# All logs to log.out
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1

# Environment variables 
env | sort > env_init.out

# Customization script
wget -O init_script_executed.sh ${PERSONAL_INIT_SCRIPT}

# Work in the "work" directory if it exists
if [[ -d "work" ]]
then
  cd work
fi

# Cloning BYOR related projects
echo "Cloning BYOR backend source code"
git clone https://${GIT_PERSONAL_ACCESS_TOKEN}@github.com/cip-core-mirrors/byor-service
echo "Cloning BYOR frontend source code"
git clone https://${GIT_PERSONAL_ACCESS_TOKEN}@github.com/cip-core-mirrors/build-your-own-radar
echo "Cloning BYOR manager source code"
git clone https://${GIT_PERSONAL_ACCESS_TOKEN}@github.com/cip-core-mirrors/byor-radar-manager
