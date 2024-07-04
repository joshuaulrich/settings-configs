#sudo certbot certonly --manual --preferred-challenges=dns -d gitlab.joshuaulrich.com,fossfinance.com,www.fossfinance.com
#
# wait a few minutes after saving the DNS data to hit enter after the final key
#
# NOTE: set this env var to the first site listed in the certbot call
CERT_DIR="gitlab.joshuaulrich.com-0001"
sudo cat /etc/letsencrypt/live/${CERT_DIR}/privkey.pem > /tmp/jmu-ssl-certs.pem
sudo cat /etc/letsencrypt/live/${CERT_DIR}/fullchain.pem >> /tmp/jmu-ssl-certs.pem
sudo mv /tmp/jmu-ssl-certs.pem .
sudo chown www-data:www-data jmu-ssl-certs.pem
sudo service nginx force-reload
