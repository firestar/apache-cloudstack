

FILE=/db.built
if [ ! -f "$FILE" ]; then
    cloudstack-setup-databases cloud:09urhnfjkf98h23njk@10.0.2.21 -i 10.0.2.22 --deploy-as=root:'342342fsdg43qtg09j3n'
    touch /db.built
fi

cloudstack-setup-management

/usr/bin/java -Djava.security.properties=/etc/cloudstack/management/java.security.ciphers -Djava.awt.headless=true -Dcom.sun.management.jmxremote=false -Xmx2G -XX:+UseParallelGC -XX:MaxGCPauseMillis=500 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/log/cloudstack/management/ -XX:ErrorFile=/var/log/cloudstack/management/cloudstack-management.err -cp /usr/share/cloudstack-management/lib/*:/etc/cloudstack/management:/usr/share/cloudstack-common:/usr/share/cloudstack-management/setup:/usr/share/cloudstack-management:/usr/share/java/mysql-connector-java.jar:/usr/share/cloudstack-mysql-ha/lib/* org.apache.cloudstack.ServerDaemon
sleep infinity
