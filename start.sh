
#!/bin/sh

if [ ! -z $DOCUMENT_ROOT ]; then
    sed -i "s#DocumentRoot /var/www/html/public\$#DocumentRoot $DOCUMENT_ROOT#g" /etc/apache2/sites-enabled/000-default.conf
    sed -i "s#<Directory /var/www/html/public>\$#<Directory $DOCUMENT_ROOT>#g" /etc/apache2/sites-enabled/000-default.conf

    sed -i "s#DocumentRoot /var/www/html/public\$#DocumentRoot $DOCUMENT_ROOT#g" /etc/apache2/sites-enabled/default-ssl.conf
    sed -i "s#<Directory /var/www/html/public>\$#<Directory $DOCUMENT_ROOT>#g" /etc/apache2/sites-enabled/default-ssl.conf

    echo 'Document root applied'
fi;

apache2ctl -D FOREGROUND
