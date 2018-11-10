tar -xf lnmp_soft.tar.gz
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2/
yum -y install pcre-devel zlib-devel
./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module
make && make install
systemctl start php-fpm
echo 123 > /usr/local/nginx/html/test.html
systemctl status httpd
systemctl stop httpd
systemctl disable httpd
/usr/local/nginx/sbin/nginx
curl http://192.168.4.5/test.html
yum -y install mariadb-server
systemctl restart mariadb
yum -y install php php-mysql
rpm -ivh php-fpm-5.4.16-42.el7.x86_64.rpm
systemctl restart php-fpm
systemctl enable php-fpm
