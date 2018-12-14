#Running Workload without background load


bg_util=0.0
bg_period=300




declare -a pids

echo bg_util is $bg_util

echo `pwd`



rm bg_resp.txt
touch bg_resp.txt



cd wl1

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller

cd ../wl2

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller


cd ../wl3

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller

cd ../wl4

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller	

cd ../wl5

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller

cd ../wl6

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller

cd ../wl7

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller

cd ../wl8

gcc job.c -o emulate_job
chmod +x emulate_job
rm wl_resp.txt
touch wl_resp.txt
gcc controller.c -o controller



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


cd wl1
mv wl_resp.txt fg_only/fg.csv

cd ../wl2
mv wl_resp.txt fg_only/fg.csv

cd ../wl3
mv wl_resp.txt fg_only/fg.csv

cd ../wl4
mv wl_resp.txt fg_only/fg.csv

cd ../wl5
mv wl_resp.txt fg_only/fg.csv

cd ../wl6
mv wl_resp.txt fg_only/fg.csv

cd ../wl7
mv wl_resp.txt fg_only/fg.csv

cd ../wl8
mv wl_resp.txt fg_only/fg.csv

cd ..

echo change to main 
echo `pwd`



#CGROUPS 50 percentile utilisation- 64.36% of CPU. 
bg_util=0.2
bg_period=300

counter=1


while [ $counter -le 4 ]
do
	declare -a pids

	echo bg_util is $bg_util
	
	echo `pwd`


	echo fg shares are 1850
	echo bg shares is 1024


	rm bg_resp.txt
	touch bg_resp.txt

	cgcreate -g cpu:group1

	cgset -r cpu.shares=1850 group1

	
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
	gcc controller.c -o controller
	
	cd ../wl2
	
	gcc job.c -o emulate_job
	chmod +x emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc controller.c -o controller


	cd ../wl3
	
	gcc job.c -o emulate_job
	chmod +x emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc controller.c -o controller

	cd ../wl4
	
	gcc job.c -o emulate_job
	chmod +x emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc controller.c -o controller	

	cd ../wl5
	
	gcc job.c -o emulate_job
	chmod +x emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc controller.c -o controller

	cd ../wl6
	
	gcc job.c -o emulate_job
	chmod +x emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc controller.c -o controller

	cd ../wl7
	
	gcc job.c -o emulate_job
	chmod +x emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc controller.c -o controller

	cd ../wl8
	
	gcc job.c -o emulate_job
	chmod +x emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc controller.c -o controller
	
	
	
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
	mv bg_resp.txt bg/cgroups_shares_50/bg_$bg_util.csv

	cd wl1
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv
	
	cd ../wl2
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv
	
	cd ../wl3
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv

	cd ../wl4
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv

	cd ../wl5
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv

	cd ../wl6
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv

	cd ../wl7
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv

	cd ../wl8
	mv wl_resp.txt cgroups_shares_50/fg_$bg_util.csv

	cd ..

	echo change to main 
	echo `pwd`

	bg_util=` python -c "print $bg_util + 0.2 "`
	counter=$(( $counter + 1 ))

done

#deadline for FG tasks and cgroups for BG
#PERIOD= 1x

bg_util=0.2

counter=1


while [ $counter -le 4 ]
do
	declare -a pids

	echo bg_util is $bg_util
	
	echo `pwd`

	#fg_util=` python -c "print (1 -  $bg_util)"`
	#echo FG Util is $fg_util


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
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller
	
	cd ../wl2
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller


	cd ../wl3
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller

	cd ../wl4
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller	

	cd ../wl5
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller

	cd ../wl6
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller

	cd ../wl7
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller

	cd ../wl8
	
	gcc dead_job.c -o dead_emulate_job
	rm wl_resp.txt
	touch wl_resp.txt
	gcc dead_controller.c -o dead_controller



	cd ../wl1
	sudo ./dead_controller 0 1 1 &
	pids[0]=$!

	cd ../wl2
	sudo ./dead_controller 0 1 1 &
	pids[1]=$!

	cd ../wl3
	sudo ./dead_controller 0 1 1 &
	pids[2]=$!

	cd ../wl4
	sudo ./dead_controller 0 1 1 &
	pids[3]=$!

	cd ../wl5
	sudo ./dead_controller 0 1 1 &
	pids[4]=$!

	cd ../wl6
	sudo ./dead_controller 0 1 1 &
	pids[5]=$!

	cd ../wl7
	sudo ./dead_controller 0 1 1 &
	pids[6]=$!

	cd ../wl8
	sudo ./dead_controller 0 1 1 &
	pids[7]=$!

	

	for pid in ${pids[*]}; do
		echo $pid
    	wait $pid
	done


	sudo killall controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall controller
	sudo killall dead_emulate_jobs
	sudo killall dead_loader
	sudo killall dead_bg_job
	echo `pwd`

	cd ..
	mkdir bg/deadline_only
	mv bg_resp.txt bg/deadline_only/bg_$bg_util.csv

	cd wl1
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv
	
	cd ../wl2
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv
	
	cd ../wl3
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv

	cd ../wl4
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv

	cd ../wl5
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv

	cd ../wl6
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv

	cd ../wl7
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv

	cd ../wl8
	mkdir deadline_only
	mv wl_resp.txt deadline_only/fg_$bg_util.csv

	cd ..

	echo change to main 
	echo `pwd`
	
	bg_util=` python -c "print $bg_util + 0.2 "`
	counter=$(( $counter + 1 ))
done

