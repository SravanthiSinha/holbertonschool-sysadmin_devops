sudo iptables -F
sudo iptables -A INPUT -p tcp -m tcp -m multiport ! --dports 22,80,8080,53,443 -j DROP -t filter
