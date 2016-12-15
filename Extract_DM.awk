#!/bin/awk -f

# Looks like:
#  Dipole moment (field-independent basis, Debye):
#      X=             -4.2612    Y=             -0.2186    Z=            -17.4410  Tot=             17.9553

BEGIN{
    count=0
    fx=fy=fz=0.0 # Catches case where no E-field set
}
{

    if ($1=="Dipole" && $2=="moment") {
        getline
        if (count==0)
            { ux=$2; uy=$4; uz=$6}
        else
            { rx=$2; ry=$4; rz=$6}
        count++
#        print $2, $4, $6
    }

# Looks like:
#  The following finite field(s) will be applied:
#   An electric field of              0.0000  0.0000  0.0100


# This triggers for every SCF, but it does not matter
    if ($1=="An" && $2="electric" && $3="field"){ 
        fx=$5
        fy=$6
        fz=$7
#        print fx,fy,fz
    }
}

END{
    print fx,fy,fz,ux,uy,uz,rx,ry,rz
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
