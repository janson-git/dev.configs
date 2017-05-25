
# cerate and mount RAMDISK PARTITION
sudo mkdir /var/ramfs
sudo mount -t ramfs -o size=1G ramfs /var/ramfs/

# COPY MYSQL FILES TO RAMDISK PARTITION
sudo /etc/init.d/mysql stop
sudo cp -R /var/lib/mysql /var/ramfs/
sudo chown -R mysql:mysql /var/ramfs/mysql

# TWEAK MYSQL DATA DIR
sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/original-mysqld.cnf
#sudo vim /etc/mysql/my.cnf
sudo sed -ie 's/datadir.*= \/var\/lib\/mysql/datadir = \/var\/ramfs\/mysql/' /etc/mysql/mysql.conf.d/mysqld.cnf 

sudo /etc/init.d/mysql start

