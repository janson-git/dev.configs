
# cerate and mount RAMDISK PARTITION
#sudo mkdir /var/ramfs
#sudo mount -t ramfs -o size=1G ramfs /var/ramfs/

# COPY MYSQL FILES TO RAMDISK PARTITION
sudo /etc/init.d/mysql stop
#sudo rm -rf /var/ramfs/*
#sudo umount /var/ramfs
#sudo chown -R mysql:mysql /var/ramfs/mysql

sudo cp -R /var/ramfs /var/lib/mysql/
#sudo chown -R mysql:mysql /var/lib/mysql

# TWEAK MYSQL DATA DIR
sudo cp /etc/mysql/original-mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
#sudo sed -ie 's/datadir.*= \/var\/lib\/mysql/datadir = \/var\/ramfs\/mysql/' /etc/mysql/mysql.conf.d/mysqld.cnf 

sudo /etc/init.d/mysql start

