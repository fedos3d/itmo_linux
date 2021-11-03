#!/bin/sh
#Task 1:
mkdir ~/test
#Task 2:
touch ~/test/list
ls -la /etc >> ~/test/list
#Task 3:
subdiramount=$(find /etc -type d | wc | awk '{print $1}')
expr $subdiramount - 1
echo "Amount of subdirs:" >> ~/test/list
echo $subdiramount >> ~/test/list
amountofhiddenfiles=$(ls -ld /etc/?* | wc | awk '{print $1}')
echo "Amount of hidden files:" >> ~/test/list
echo $amountofhiddenfiles >> ~/test/list
#Task 4:
mkdir ~/test/links
#Task 5:
ln ~/test/list ~/test/links/list_hlink
#Task 6:
ln -s ~/test/list ~/test/links/list_slink
#Task 7:
hlinkamount=$(find ~ -samefile ~/test/links/list_hlink | wc | awk '{print $1}')
listamount=$(find ~ -samefile ~/test/list | wc | awk '{print $1}')
slinkamount=$(find ~ -samefile ~/test/links/list_slink | wc | awk '{print $1}')
echo "Amount of hardlinks for list_hlink:"
echo $hlinkamount
echo "Amount of hardlinks for list:" 
echo $listamount
echo "Amount of hardlinks for list_slink:"
echo $slinkamount
#Task 8:
ls -l ~/test/links | wc | awk '{print $1}' >> ~/test/links/list_hlink
#Task 9:
compare=$(diff -s ~/test/links/list_hlink ~/test/links/list_slink | grep "identical")
echo "Compare 2 files: "
if [ -z "$compare" ]
then
	echo "Something went wrong"
else 
	echo "YES"
fi
#Task 10:
rename 'list' 'list1' ~/test/
#Task 11:
compare=$(diff -s ~/test/links/list_hlink ~/test/links/list_slink | grep "identical")
echo "Compare 2 files again: "
if [ -z "$compare" ]
then
	echo "Something went wrong again"
else
	echo "YES"
fi
#Task 12:
ln ~/test/links/list_slink ~/list1 #something is wrong, in task it says list_link but no such file
#Task 13:
touch ~/list_conf
find /etc -name "*.conf" >> ~/list_conf
#Task 14:
touch ~/list_d
find /etc -type d -name "*.d" >> ~/list_d
#Task 15:
touch ~/list_conf_d
cat ~/list_conf >> ~/list_conf_d
cat ~/list_d >> ~/list_conf_d
#Task 16:
mkdir ~/test/.sub
#Task 17:
cp ~/list_conf_d ~/test/.sub/
#Task 18:
cp --backup ~/list_conf_d ~/test/.sub/ #Donno if command is correct
#Task 19:
tree -a -C ~/test
#Task 20:
touch ~/man.txt
man man >> ~/man.txt
#Task 21:
split -b 1024 --additional-suffix=.splitman ~/man.txt ~/
#Task 22:
mkdir ~/man.dir
#Task 23:
mv ~/*.splitman ~/man.dir
#Task 24:
cat ~/man.dir/*.splitman > ~/man.dir/man.txt
#Task 25:
echo "Compare two man.txt files after splitting and join: "
compare=$(diff -s ~/man.txt ~/man.dir/man.txt | grep "identical")
if [ -z "$compare" ]
then
	echo "Something went wrong again"
else
	echo "YES"
fi
#Task 26:
echo "Random lines \n one line \n and one more" >> ~/man.txt
sed  -i '1i Lines in the begginnig of a file' ~/man.txt
#Task 27:
diff -u ~/man.dir/man.txt ~/man.txt > ~/patch.patch
#Task 28:
mv ~/patch.patch ~/man.dir/
#Task 29:
patch ~/man.dir/man.txt ~/man.dir/patch.patch
#Task 30:
echo "Compare two man.txt files after patching:"
compare=$(diff -s ~/man.txt ~/man.dir/man.txt | grep "identical")
if [ -z "$compare" ]
then
	echo "Somethig went wrong in the third time"
else
	echo "YES"
fi

