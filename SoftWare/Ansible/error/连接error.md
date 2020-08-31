1. Using a SSH password instead of a key is not possible because Host Key checking is enabled and sshpass does not support this.  Please add this host's fingerprint to your known_hosts file to manage this host


背景：第一次连接ansible的host里的一堆机器时，会出标题里面的错，解决办法如下： 
vi ansible.cfg 
# uncomment this to disable SSH key host checking 
host_key_checking = False 