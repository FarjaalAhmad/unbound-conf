sudo rm -f /etc/unbound/unbound.conf
sudo wget https://raw.githubusercontent.com/FarjaalAhmad/unbound-conf/main/unbound.conf -O /etc/unbound/unbound.conf
echo "127.0.0.1:5335" > ~/resolvers.txt
sudo -u root sh -c 'echo "net.core.rmem_max=1048576" >> /etc/sysctl.conf'
sudo mkdir -p /run/systemd/resolve/
sudo -u root sh -c 'echo "nameserver 127.0.0.1" > /run/systemd/resolve/resolv.conf'
sudo -u root sh -c 'echo "nameserver 1.1.1.1" >> /run/systemd/resolve/resolv.conf'
sudo ln -fs /run/systemd/resolve/resolv.conf /etc/resolv.conf
echo 'alias dig="dig @localhost -p 5335"' >> ~/.bashrc
source ~/.bashrc
sudo systemctl enable unbound
sudo systemctl start unbound
clear
echo "Done"
echo "Test yourself now by Executing: dig google.com"
