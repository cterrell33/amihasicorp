#!/bin/bash -e

wget https://packages.chef.io/files/stable/chef-server/12.19.31/el/7/chef-server-core-12.19.31-1.el7.x86_64.rpm

sudo rpm -Uvh chef-server-core-12.19.31-1.el7.x86_64.rpm

sudo chef-server-ctl reconfigure 

sudo chef-server-ctl user-create chef-admin Christopher 30 cterrell@kingdomtech.net 'forever' --filename ~/user.pem

sudo chef-server-ctl org-create kingdomtech 'Kingdomtech, llc.' --association_user chef-admin --filename ~/org-validator.pem

rm chef-server-core-12.19.31-1.el7.x86_64.rpm