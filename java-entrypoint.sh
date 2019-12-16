#!/bin/sh

keytool -importcert -trustcacerts -keypass changeit -file /usr/local/share/ca-certificates/bitbucket-cenco.crt -alias bitbucket -keystore $JAVA_HOME/jre/lib/security/cacerts -noprompt -storepass changeit

java -server -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1 $JAVA_OPTS -jar $1
