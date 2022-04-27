#!/bin/bash

WORKINGDIR=/root/externalbackup
MOUNTDIR=/media/externalbackup
DEVICE=/dev/sdc1
CRYPT="usb-crypt"
MAPPER=/dev/mapper/$CRYPT
CONFFILE=444c9701-00d0-4b14-8528-5aacaedc4c32.conf

cd $WORKINGDIR

echo ""
echo "### Festplatte einbinden..."
cryptsetup luksOpen $DEVICE $CRYPT
mount $MAPPER $MOUNTDIR
echo ""
echo "### Festplatte einbinden..."
if [ -e $MAPPER ]; then
    echo "# $MAPPER eingebunden."
else
    echo "# Fehler beim einbinden...($MAPPER)."
    
echo ""
echo "############################## "
echo ""
echo "### Backup2-Client wird temporär installiert..."
apt install -y iserv-backup2-client

echo ""
echo "############################## "
echo ""
echo "### Backup wird gestartet. Es werden nur Fehler ausgegeben."
iservbackup2 -q -l $WORKINGDIR/$CONFFILE

echo ""
echo "############################## "
echo ""
echo "### Backup2-Client wird wieder deinstalliert, um Fehler in iservchk zu vermeiden..."
apt remove -y iserv-backup2-client

echo ""
echo "############################## "
echo ""
echo "### Backup2-Client wird wieder deinstalliert, um Fehler in iservchk zu vermeiden..."
umount /dev/mapper/usb-crypt
cryptsetup luksClose usb-crypt

echo ""
echo "############################## "
echo ""
if [ ! -e $MAPPER ]; then
    echo "### Festplatte ausgehängt. "
    echo "### Bitte in der IServ-Oberfläche unter Verwaltung-Backups überprüfen, ob "
    echo "$MOUNTDIR/iserv "
    echo "### ohne Fehler durchgelaufen ist."
else
    echo "# Fehler beim einbinden...($MAPPER)."
    echo "### Bitte Ausgaben oben überprüfen und in der IServ-Oberfläche unter Verwaltung-Backups nachsehen, ob für $MOUNTDIR/iserv Feh$
fi

echo ""
echo "############################## "
echo ""
echo "### Wechsle Verzeichnis..."
cd -





