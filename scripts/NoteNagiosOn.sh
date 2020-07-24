sudo dpkg -l selinux*

sudo apt-get update
sudo apt-get install -y autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.2 libgd-dev

cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.3.tar.gz
tar xzf nagioscore.tar.gz


cd /tmp/nagioscore-nagios-4.4.3/
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all


sudo make install-groups-users
sudo usermod -a -G nagios www-data


sudo make install

sudo make install-daemoninit

sudo make install-commandmode

sudo make install-config

sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi

sudo ufw allow Apache
sudo ufw reload

sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin


sudo systemctl restart apache2.service


sudo systemctl start nagios.service


curl http://localhost/nagios

sudo apt-get update
sudo apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext

sudo apt-get install -y libpqxx3-dev

sudo apt-get install -y libdbi-dev

sudo apt-get install -y libfreeradius-client-dev

sudo apt-get install -y libldap2-dev

sudo apt-get install -y libmysqlclient-dev

sudo apt-get install -y smbclient

sudo apt-get install -y qstat

sudo apt-get install -y fping

sudo apt-get install -y qmail-tools

cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz

cd /tmp/nagios-plugins-release-2.2.1/
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install

#The plugins will now be located in 
#/usr/local/nagios/libexec/.

curl http://localhost/nagios


 wget --no-check-certificate -O nagios-conf.tar.tgz https://netix.dl.sourceforge.net/project/nconf/nconf/1.3.0-0/nconf-1.3.0-0.tgz
 
 tar zxf nagios-conf.tar.tgz
 
 sudo mkdir /usr/local/nagios/share/nconf
 
 sudo mv nconf/* /usr/local/nagios/share/nconf
 
 #chown -R apache:apache /usr/local/nagios/share/nconf
sudo chown -R www-data:ubuntu /usr/local/nagios/share/nconf
 
 
 chmod  775 /usr/local/nagios/share/nconf/bin/*
 
 sudo apt-get install mysql-server
 sudo apt-get install perl-DBI 
 sudo apt-get install perl-DBD-MySQL 
 sudo apt-get install php-mysql
 
sudo apt install mysql-client-core-5.7   
sudo apt install mariadb-client-core-10.1

sudo apt install mysql-client-5.7 
sudo apt install mariadb-client-10.1
 
mysql -u root -p

CREATE DATABASE nconf;

CREATE USER nconfadmin@localhost IDENTIFIED BY 'nconfpassword';


GRANT ALL PRIVILEGES ON typo.* TO nconfadmin@localhost;

FLUSH PRIVILEGES;
exit


service httpd restart


sudo yum install mock


