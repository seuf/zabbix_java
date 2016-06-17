
VERSION = 3.0.1
JAVAC = /usr/share/java/jdk/bin/javac
JAR = /usr/share/java/jdk/bin/jar
LIB = lib/android-json-4.3_r3.1.jar:lib/logback-core-0.9.27.jar:lib/logback-classic-0.9.27.jar:lib/slf4j-api-1.6.1.jar
ZJG = bin/zabbix-java-gateway-$(VERSION).jar


all: $(ZJG)

$(ZJG): class src/com/zabbix/gateway/*.java
	JAVA_HOME=/logiciels/java/jdk
	$(JAVAC) -d class/src -classpath $(LIB) src/com/zabbix/gateway/*.java
	$(JAR) cf $(ZJG) -C class/src .
