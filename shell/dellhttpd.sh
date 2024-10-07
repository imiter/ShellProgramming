#!/bin/bash

firewall-cmd --permanent --remove-service={http,https} \
            && firewall-cmd --reload
            && systemctl disable --now httpd
            && rm -f /var/www/html/*