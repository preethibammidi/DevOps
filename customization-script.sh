mount -t proc none /proc
mount -t sysfs none /sys
mount -t devpts none /dev/pts

export HOME=/etc/skel

#YOUTUBE_EXTENSION_URL=${YOUTUBE_EXTENSION_URL-"https://addons.mozilla.org/firefox/downloads/latest/463677/addon-463677-latest.xpi"}

dbus-uuidgen >/etc/machine-id 

# Install Packages
#echo "deb https://dl.bintray.com/balaswecha/balaswecha-dev trusty main" > /etc/apt/sources.list.d/balaswecha.list
apt-get update
apt-get install -y openjdk-7-jre pepperflashplugin-nonfree
#Remove it - licensing conflicts
#update-pepperflashplugin-nonfree --install
apt-get install -y ssh-server gimp arduino

# install pencilbox and skin packages 
#apt-get install -y --force-yes pencilbox balaswecha-skin balaswecha-sync

# adding youtube extension in firefox
#sudo bash /firefox-addon-installer.sh $YOUTUBE_EXTENSION_URL

apt-get clean

###### Branding Changes ########

# Regenerate default Schemas
glib-compile-schemas /usr/share/glib-2.0/schemas

umount /proc || sudo umount -lf /proc
umount -lf /sys
umount -lf /dev/pts
