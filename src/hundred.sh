#!/bin/bash

for i in {1..25}
    do docker run --restart=always --name adhocnw$i -P -d alpine
    sleep 3
done

for i in {26..50}
    do docker run --restart=always --name adhocnw$i -P -d fedora
    sleep 3
done

for i in {51..75}
    do docker run --restart=always --name adhocnw$i -P -d centos
    sleep 3
done

for i in {76..100}
    do docker run --restart=always --name adhocnw$i -P -d java
    sleep 3
done
