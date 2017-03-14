# non_root_Ubuntu_apache_docker

Base on : 
```
sudo setcap 'cap_net_bind_service=+ep' /usr/sbin/apache2
sudo /etc/init.d/apache2 stop
sudo chown -R www-data: /var/{log,run}/apache2/
sudo -u www-data apache2ctl start
```

Build image

```
# git clone https://github.com/chio-nzgft/non_root_Ubuntu_apache_docker.git
# cd non_root_Ubuntu_apache_docker
# docker build -t non-root-apache .

```
Run image

```
docker run -d -P  --privileged=true -p 192.168.0.70:8080:8080 --name=non-root-apache non-root-apache
```
