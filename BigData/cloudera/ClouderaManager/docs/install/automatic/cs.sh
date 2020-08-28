yum install cloudera-manager-server

/opt/cloudera/cm/schema/scm_prepare_database.sh mysql cm cm 123456


systemctl start cloudera-scm-server





mysql -uroot -p123456 <<EOF  
drop database metastore;
EOF  