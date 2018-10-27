sudo iptables -A INPUT -m iprange --src-range 131.94.133.180-131.94.133.200 -p tcp --dport 80 -j REJECT --reject-with tcp-reset
sudo iptables-save
sudo iptables -L -n
