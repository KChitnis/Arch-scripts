iw dev
echo "Enter the name of wifi card:"
read w
ip link set $w up
echo "Enter the name of ssid:"
read s
echo "Enter the password:"
read p
sudo su -c 'wpa_supplicant -B -D nl80211,wext -i $w -c <(wpa_passphrase "$s" "$p")'
dhcpcd $w
tput setaf 2; echo "DONE!"
