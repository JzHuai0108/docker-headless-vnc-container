
n=0
until [ $n -ge 5 ]
do
   $CMD && break  # substitute your command here
   n=$[$n+1]
   sleep 10
done
