#!/bin/awk -f

BEGIN{j=0}

{

if ($1=="Dipole" && $2=="moment") {

getline

print $2, $4, $6

}

if ($5=="Field="){ 
print substr($0,1,2)}

#print $field

}




#BEGIN{ 
#if ($1=="Dipole" && $2=="moment") {
#getline
#i=0
#dpx[i]=$2
#dpy[i]=$4
#dpz[i]=$6}
#i++
#if ($1=="Field="){
#field=$1
#}
#}
#END{

#for (k=0;k<=i;k++) {
#print k
#print field
#print dpx[k],dpy[k],dpj[k]}}
