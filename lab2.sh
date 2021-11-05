#!/bin/bash
#Task 1:
awk -F: '{ print "user", $1, "has id", $3 }' /etc/passwd > ~/work3.log 
#Task 2:
chage -l root | head -n 1 | awk '{print "root last pass change:", $5, $6, $7}' >> ~/work3.log
#Task 3: (!Should I remove last comma?)
cut -d: -f1 /etc/group | sort | awk -F\, '{print $1","}' >> ~/work3.log
#Task 4: (check if it works)
touch readme.txt
echo "Be careful!" > readme.txt
cp readme.txt /etc/skel
#Task 5:
useradd u1
echo "12345678" | passwd u1 --stdin
#Task 6:
groupadd g1
#Task 7:
usermod -a -G g1 u1
#Task 8:
id u1 >> ~/work3.log
#Task 9:
usermod -a -G g1 user
#Task 10:
groupnames -g g1 -l | awk -v OFS="," '{$1=$1}1' >> ~/work3.log
#Task 11:
chsh --shell /bin/mc u1
#Task 12:
useradd u2
echo "87654321" | passwd u2 --stdin
#Task 13:
mkdir /home/test13
cp ~/work3.log /home/test13/work3-1.log
cp ~/work3.log /home/test13/work3-2.log
#Task 14:
chmod 640 /home/test13/*.log
chown u1 /home/test13/*.log
chgrp u2 /home/test13/*.log
chown u1 /home/test13/
chgrp u2 /home/test13/
chmod 550 /home/test13/
#Test 15:
mkdir /home/test14

