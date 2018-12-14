
#CGROUPS 64% quota to background tasks


bg_util=0.8
bg_period=300


declare -a pids

echo bg_util is $bg_util

echo `pwd`





rm bg_resp.txt
touch bg_resp.txt




sudo gcc -o bg_job	bg_job.c
sudo gcc -o loader bg_controller.c
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &
sudo ./loader $bg_util $bg_period &



cd wl1

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller

cd ../wl2

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller


cd ../wl3

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller

cd ../wl4

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller	

cd ../wl5

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller

cd ../wl6

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller

cd ../wl7

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller

cd ../wl8

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller2.c -o controller



cd ../wl1
sudo ./controller 0 1 1 &
pids[0]=$!

cd ../wl2
sudo ./controller 0 1 1 &
pids[1]=$!

cd ../wl3
sudo ./controller 0 1 1 &
pids[2]=$!

cd ../wl4
sudo ./controller 0 1 1 &
pids[3]=$!

cd ../wl5
sudo ./controller 0 1 1 &
pids[4]=$!

cd ../wl6
sudo ./controller 0 1 1 &
pids[5]=$!

cd ../wl7
sudo ./controller 0 1 1 &
pids[6]=$!

cd ../wl8
sudo ./controller 0 1 1 &
pids[7]=$!


for pid in ${pids[*]}; do
	echo $pid
	wait $pid
done


sudo killall controller
sudo killall emulate_job
sudo killall loader
sudo killall bg_job
sudo killall controller
sudo killall emulate_job
sudo killall loader
sudo killall bg_job
sudo killall controller
sudo killall emulate_job
sudo killall loader
sudo killall bg_job
sudo killall controller
sudo killall emulate_job
sudo killall loader
sudo killall bg_job
sudo killall controller
sudo killall emulate_jobs
sudo killall loader
sudo killall bg_job
echo `pwd`

cd ..
mkdir bg/cgroups_quota_64
mv bg_resp.txt bg/cgroups_quota_64/bg_$bg_util.csv

cd wl1
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ../wl2
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ../wl3
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ../wl4
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ../wl5
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ../wl6
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ../wl7
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ../wl8
mkdir cgroups_quota_64
mv wl_resp.txt cgroups_quota_64/fg_$bg_util.csv

cd ..

echo change to main 
echo `pwd`








