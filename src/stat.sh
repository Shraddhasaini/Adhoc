#!/bin/bash

for i in {1..100}
do
  docker stats adhocnw$i >> cpu.txt
done
