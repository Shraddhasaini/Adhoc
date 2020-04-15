# :dart:	 Assignment 1

## 1. Create Directories Structure

![Structure](Images/One1.png)

### Command:
```
$ mkdir -p A/{B/{D/{I/M/J,J/L/Z},E/H/L/Z},C/{F/H/L/Z,G/K/L/Z}}
$ find . 
(or)
$ tree A
```
![Output](Images/One.png)



## 2. Permission for Date command

### Command:
```
$ adduser Adhoc
$ cd /bin/
$ find date
$ ls -ld date
$ sudo su
$ chown Adhoc date
$ chmod 700 date
$ chmod -rwx /bin/ ------> For removing permission for all other commands
```
![Output](Images/Two1.png)

![Output](Images/Two2.png)

![Output](Images/Two3.png)

![Output](Images/Two4.png)


## 3. User Data Copy

### Command:
```
$ adduser b
$ su b
$ mkdir dir001
$ su shraddha
$ sudo cp /home/b/dir001 /home/shraddha/Adhoc
```
![Output](Images/Three1.png)

![Output](Images/Three2.png)

![Output](Images/Three3.png)


## 4. Run cal command for 10 secs store output in a file

### Command:
```
$ cal >> /tmp/a.txt & sleep 10
$ cat /tmp/a.txt
```
![Output](Images/Four.png)

