groupadd solrgrp
mkdir  -m 755 -p /appl/solr
mkdir  -m 755 -p /arch/solr/solrusr
mkdir -m 755 -p /db_data/solr/solrusr
mkdir  -m 755 -p /log/solr/solrusr
useradd -g solrgrp -s /bin/bash -m -d /appl/solr/solrusr solrusr
passwd solrusr
chgrp solrgrp /appl/solr /arch/solr /db_data/solr /log/solr
chown -Rf  solrusr:solrgrp  /arch/solr/solrusr /db_data/solr/solrusr /log/solr/solrusr
chmod 755 /appl/solr/solrusr /arch/solr/solrusr /db_data/solr/solrusr /log/solr/solrusr 
chown -R solrusr:solrgrp /appl/solr/solrusr /arch/solr/solrusr /db_data/solr/solrusr /log/solr/solrusr
su - solrusr -c "mkdir repo"
su - solrusr -c "mkdir -m 755 utility"
su - solrusr -c "ln -s /arch/solr/solrusr arch"
su - solrusr -c "ln -s /db_data/solr/solrusr dbs"
su - solrusr -c "ln -s /log/solr/solrusr log"
su - solrusr -c "echo export SOLR_HOME=${HOME} >> /appl/solr/solrusr/.bash_profile"
echo "	if [ -f ~/setSOLR.env ]; then"  >> /appl/solr/solrusr/.bash_profile
echo "		. ~/setSOLR.env " >> /appl/solr/solrusr/.bash_profile
echo "		fi "  >> /appl/solr/solrusr/.bash_profile
echo "		if [ -f ~/setCUST.env ]; then " >> /appl/solr/solrusr/.bash_profile
echo "		. ~/setCUST.env " >> /appl/solr/solrusr/.bash_profile
echo "		fi " >> /appl/solr/solrusr/.bash_profile 
su - solrusr -c "vi .bash_profile"
su - solrusr -c "chmod 644 .bash_profile .bashrc"
su - solrusr -c "rm -f .bash_logout"
su - solrusr -c "cp -Rf /mnt/* /appl/solr/solrusr/repo/"
su - solrusr -c "chown -Rf solrusr:solrgrp /appl/solr/solrusr/repo"
su - solrusr -c "chmod -Rf 775 /appl/solr/solrusr/repo"
su - solrusr -c "tar zxvf /appl/solr/solrusr/repo/solr-6.6.3.tar.gz"
su - solrusr -c "ln -s solr-6.6.3 solr"
su - solrusr -c "tar zxvf repo/wbSOLR_149_20190718.tar.gz"
su - solrusr -c "./wb/wbSOLR.sh"
echo "Configure the solr Workbench and save&exit && chosse workbench 3 and deply modules of solr "
echo "Then crete the node using worbench 5 select R & L %%% start solr"

