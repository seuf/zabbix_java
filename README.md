# Zabbix Java Gateway

## Description

This is the Zabbix Java Gateway sources updated to allow
 * jmx.discovery items (with Mbeans auto discovery)
 * Jboss jmx
 * Weblogic T3 protocol

## How it work

You have to specify a username in your JMX item like "user:protocol"

Where protocol can be one of :
 * jmx : to use the standard jmx url ()
 * jboss : to use an url for jboss monitoring
 * t3 : to use a weblogic t3 connexion.
 * t3s : for weblogic t3s connexion

Here is the configured urls according to each protocol.
``` 
String jmx_url      = "service:jmx:rmi:///jndi/rmi://[" + conn + "]:" + port + "/jmxrmi"; // default
String jboss_url    = "service:jmx:remoting-jmx://" + conn + ":" + port; // jboss
String t3_url       = "service:jmx:t3://"+conn+":"+port+"/jndi/weblogic.management.mbeanservers.runtime"; // T3
String t3s_url      = "service:jmx:t3s://"+conn+":"+port+"/jndi/weblogic.management.mbeanservers.runtime"; // T3S
```

## Requirements

Copy the following libs into the zabbix java gateway lib directory :
* wlthint3client.jar : for weblogic t3 protocol
* jboss-remoting-3.2.18.GA-redhat-1.jar : for jboss

## Compilation

To build the Zabbix Java Gateway :
Just clone this repository on your serveur with the JDK, then 
Edit the Makefile to specify the javac and jar binaries path.
Compile :
```
make
```

This will generate a bin/zabbix-java-gatewat-X.Y.Z.jar package


## Deployment

Just copy the generated jar into the zabbix java bin dir.