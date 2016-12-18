# generate some Efields for Gaussian calcs.

for i
do

for DIRECTION in x y z
do
    for PM in '-' '+'
    do
for STRENGTH in 0 1 2 3 4 5 10 15 20 30 40 50 60 70 80 90 100

    #"x+0" "x+1" "x+10" "x+100" "x+1000" "y+1" "y+10" "y+100" "y+1000"
do
 FIELD="${DIRECTION}${PM}${STRENGTH}"
 echo $FIELD
 filename=` echo "${i%.*}"_${FIELD}.com | sed -e s/+/p/ -e s/-/m/ `
 echo $filename

 cat HEADER | sed "s/FIELD/${FIELD}/" > $filename
 cat "${i}" >> $filename
 echo "" >> $filename
done
done
done
done
