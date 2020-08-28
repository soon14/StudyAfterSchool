> which java
/usr/bin/java

> ls -lrt /usr/bin/java

/usr/bin/java -> /etc/alternatives/java

> ls -lrt /etc/alternatives/java
lrwxrwxrwx. 1 root root 73 7月  23 14:43 /etc/alternatives/java -> /usr/lib/jvm/

java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre/bin/java

/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.232.b09-0.el7_7.x86_64

JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64
JRE_HOME=$JAVA_HOME/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH
