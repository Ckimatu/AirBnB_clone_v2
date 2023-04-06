#!/usr/bin/env bash
# setting up my web servers for  the deployment of web_static

sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'

sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo "<html>
<<<<<<< HEAD
	<head>
	</head>
	<body>
	Holberton School
	</body>
=======
  <head>
  </head>
  <body>
    Holberton School
  </body>
>>>>>>> 3053b01b5abf537a889dc59e5aedd0be139b1c74
</html>" | sudo tee /data/web_static/releases/test/index.html
sudo rm -f /data/web_static/current
sudo ln -s /data/web_static/releases/test /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
<<<<<<< HEAD
sudo sed -i '/listen 80 default_server/a location /hbnb_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default
=======
sudo sed -i '/listen 80 default_server/a location /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-enabled/default
>>>>>>> 3053b01b5abf537a889dc59e5aedd0be139b1c74
sudo service nginx restart
