FROM java
maintainer shraddhasaini99@gmail.com
env classname=Add
#for future
run mkdir /codes
add Add.java /codes/Add.java
#write a step to compile code
workdir /codes/
RUN javac Add.java
CMD java Add
