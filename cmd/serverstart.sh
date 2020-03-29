#!/bin/ash
java -server -Xms${MIN_MEM} -Xmx${MAX_MEM} -XX:PermSize=256M -XX:MaxPermSize=256M -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSParallelRemarkEnabled -XX:CMSInitiatingOccupancyFraction=70 -XX:+DisableExplicitGC -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:+UseTLAB -XX:ParallelGCThreads=${GCTHREADS} -jar /minecraft_data/${JARFILE} nogui
