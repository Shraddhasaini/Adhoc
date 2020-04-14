# Docker Deep Dive Task 1 :whale:
------
[Youtube Video for this task](https://www.youtube.com/watch?v=oxxAqV1p1Ew)
## 1. Multiple Containers
> Write Python code to create **100 Containers**. / bash script.
>
> Each **25 Container** will be from *Alpine, Fedora, centos* and *Java* image.
>
> All containers must be running forever even if you reboot your system.
>
> Name of container will be *Adhconw1* to *Adhocnw100*.
>
>> You can assume anything as a parent process.
>

### :atom: Commands:

```
$sudo su
$docker pull alpine
$docker pull fedora
$docker pull centos
$docker pull java
$docker images
$touch hundred.sh
$atom hundred.sh 
$chmod +x hundred.sh
$./hundred.sh
$docker ps
```
### :spiral_notepad: Shell Script:

```shell
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
```
### :bulb: Output:

