#!/bin/sh

# copy default liquidsoap.liq from home dir to /config
if ! [ -e /config/liquidsoap.liq ]; then
  cp /home/liquidsoap.liq /config/liquidsoap.liq
fi
chown -R nobody:users /config

# Set proper UID/GID/UMASK as on host system
# unRAID host uses 99:100 for nobody:users, and a umask of 0000
usermod -u $USER_ID nobody
usermod -g $GROUP_ID nobody
umask $UMASK

# Allow all users read and write access to all sound devices
chmod -R a+rwX /dev/snd/

# run alsa.sh to set up sound device
if [ -e /config/alsa.sh ]; then
  /bin/bash /config/alsa.sh
fi

# run Liquidsoap
exec /sbin/setuser nobody /usr/bin/liquidsoap /config/liquidsoap.liq