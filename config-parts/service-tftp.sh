set service tftp-server directory '/config/tftpboot'
set service tftp-server listen-address 10.1.0.1
curl -L http://boot.ipxe.org/ipxe.efi -o /config/tftpboot/ipxe.efi
curl -L http://boot.ipxe.org/undionly.kpxe -o /config/tftpboot/undionly.kpxe
sudo chown -R tftp:tftp /config/tftpboot/