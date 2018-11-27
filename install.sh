#!/usr/bin/env bash

cd /home/vagrant

sudo echo "--> Insatll curl <--"

sudo apt-get install -y --force-yes curl

sudo echo "--> Install nodejs <--"


sudo apt-get update -y --force-yes

sudo su
curl -sL https://deb.nodesource.com/setup_11.x | bash -
apt-get install -y --force-yes nodejs
exit

#sudo apt-get install -y --force-yes gcc g++ make
#curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#sudo apt-get update -y --force-yes && sudo apt-get install -y --force-yes yarn

sudo echo "--> Installing Postgresql <--"

PSDSLIST=$(cat <<EOF
deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main
EOF
)
echo "${PSGSLIST}" > /etc/apt/sources.list.d/pgdg.list

sudo apt-key add /var/www/html/psgs.asc

sudo apt-get update -y --force-yes

apt-get install -y --force-yes postgresql-10

# Install mysql other version maria db
sudo echo "--> Installing Mysql Server <--"
# Install MySQL
###	echo 'mysql-server mysql-server/root_password password vagrant' | debconf-set-selections
###	sudo echo 'mysql-server mysql-server/root_password_again password vagrant' | debconf-set-selections
###	sudo apt-get install -y --force-yes mysql-server

###sudo echo "Updating mysql configs in /etc/mysql/my.cnf."
###if [ sed -i "s/bind-address.*/# bind-address = 0.0.0.0/" /etc/mysql/my.cnf ]; then
###    sudo echo "Updated mysql bind address in /etc/mysql/my.cnf to 0.0.0.0 to allow external connections."
###fi
###sudo /etc/init.d/mysql stop
###sudo /etc/init.d/mysql start

sudo echo "--> Install git <--"

###sudo apt-get install -y --force-yes git-core
###sudo apt-get install -y --force-yes git-ftp

sudo apt-get install -y --force-yes ntp ntpdate

sudo service ntp stop
sudo ntpdate -s time.nist.gov
sudo service ntp start

sudo echo "--> End of shell script <--"
#fi