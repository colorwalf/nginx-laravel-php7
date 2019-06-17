#echo "http://nl.alpinelinux.org/alpine/latest-stable/main" > /etc/apk/repositories
#echo "http://nl.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
#echo "nameserver 8.8.8.8" >> /etc/resolv.conf

apk update
apk upgrade
apk add git autoconf build-base linux-headers libaio-dev php7-dev
ln -s /usr/bin/php-config7 /usr/bin/php-config
ln -s /usr/bin/phpize7 /usr/bin/phpize
cd /root/
git clone https://github.com/swoole/swoole-src.git
cd swoole-src/
git checkout v4.3.5
phpize
./configure
make && make install
apk del libaio-dev php7-dev git autoconf build-base linux-headers


apk add --no-cache file git autoconf automake libtool gettext gettext-dev make g++ texinfo curl
git clone https://github.com/emcrisostomo/fswatch.git
cd fswatch/
git checkout 1.14.0
./autogen.sh
./configure
make && make install

apk del --no-cache file git autoconf automake libtool gettext gettext-dev make g++ texinfo curl
rm -rf /var/cache/apk/*
rm -rf /root/swoole-src/
rm -rf /root/fswatch/
rm -rf /tmp/*
