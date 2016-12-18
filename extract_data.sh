rm MonoPCBM.dat C60.dat

for i in C60_*.log
do
 awk -f ../Extract_DM.awk "${i}" >> C60.dat
done

for i in MonoPCBM_*.log
do
 awk -f ../Extract_DM.awk "${i}" >> MonoPCBM.dat
done
