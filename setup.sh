sudo rm -f /etc/unbound/unbound.conf
sudo wget https://raw.githubusercontent.com/FarjaalAhmad/unbound-conf/main/unbound.conf -O /etc/unbound/unbound.conf
wget https://raw.githubusercontent.com/FarjaalAhmad/unbound-conf/main/resolvers.txt -O ~/resolvers.txt
echo "net.core.rmem_max=1048576" >> /etc/sysctl.conf
echo "nameserver 127.0.0.1" > /run/systemd/resolve/resolv.conf
sudo ln -fs /run/systemd/resolve/resolv.conf /etc/resolv.conf
echo 'alias dig="dig @localhost -p 5335"' >> ~/.bashrc
source ~/.bashrc
systemctl enable unbound
systemctl start unbound
clear
echo "Done"
