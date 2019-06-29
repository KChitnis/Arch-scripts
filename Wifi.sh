iw dev
echo "Enter the name of wifi card:"
read w
ip link set $w up
echo "Enter the name of ssid:"
read s
echo "Enter the password:"
read p
wpa_supplicant -B -i $w -c <(wpa_passphrase "$s" "$p")
dhcpcd $w
echo "DONE!"
