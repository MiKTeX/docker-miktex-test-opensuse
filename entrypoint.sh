#!/bin/sh -e

zypper update -y

if [ -d /miktex/build ]; then
    zypper --no-gpg-checks --non-interactive install /miktex/build/*.rpm
else
    echo TODO
fi

GROUP_ID=${GROUP_ID:-1001}
USER_ID=${USER_ID:-1001}

groupadd -g $GROUP_ID -o joe
useradd --shell /bin/bash -u $USER_ID -g $GROUP_ID -o -c "" -m joe
export HOME=/home/joe
exec gosu joe "$@"
