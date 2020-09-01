# How to install

0. Setup RPi and SSH to it
1. Install dependencies `sudo apt-get install imagemagick curl`
2. Set correct timezone `sudo unlink /etc/localtime && sudo ln -s /usr/share/zoneinfo/Europe/Helsinki /etc/localtime`
3. Clone this repository `git clone https://github.com/majori/clubroom-webcam`
4. Switch working directory `cd clubroom-webcam`
5. Run `crontab < ./crontab`
6. Generate SSH key for RPi which will be used to communicate with the server `ssh-keygen -t rsa -b 4096`
7. Go to server and add the just created SSH public key to `authorized_keys`
8. Webcam should now take pictures every 30 seconds
