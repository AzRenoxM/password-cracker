  1 #!/bin/bash
  2 
  3 file_name='name.pdf'
  4 file_path=$(readlink -f $file_name)
  5 
  6 password_list=./rockyou.txt/rockyou_1.txt
  7 password_list_path=$(readlink -f $password_list)
  8 
  9 declare -i iterator=1
 10 
 11 for i in $(cat $password_list_path); do
 12         iterator=$(($iterator+1))
 13         qpdf --password=$i --decrypt $file_path ./output.pdf 2>/dev/null
 14         echo "Password: "$i
 15 done
