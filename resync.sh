CONFIG_FILE='quantisnet.conf'
SRCDIR="$(pwd)"
CONFIGFOLDER=$SRCDIR/.quantisnetcore
COIN_DAEMON='quantisnetd'
COIN_CLI='quantisnet-cli'

/usr/local/bin/$COIN_CLI stop
cd /$CONFIGFOLDER
rm -r blocks database debug.log peers.dat banlist.dat chainstate db.log
wget https://github.com/0sunrise/QuantisNet-X11/raw/master/blocks.zip
unzip blocks.zip
rm blocks.zip
cd
cat << EOF >> $CONFIGFOLDER/$CONFIG_FILE
maxconnections=16
EOF

/usr/local/bin/$COIN_DAEMON
