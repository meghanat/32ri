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

	bg_period=` python -c "print ( 0.95 - $bg_util ) / $bg_util * 300.0 " `


	rm bg_resp.txt
	touch bg_resp.txt
	
	

	sudo gcc -o dead_bg_job	dead_bg_job.c
	sudo gcc -o dead_loader dead_bg_controller.c
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &	
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &        


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


	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_jobs
	sudo killall dead_loader
	sudo killall dead_bg_job
	echo `pwd`

	cd ..
	mv bg_resp.txt bg/300_deadline_bg_vary/bg_$bg_util.csv

	cd wl1
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl2
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl3
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl4
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl5
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl6
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl7
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl8
	mv wl_resp.txt 300_deadline_bg_vary/fg_$bg_util.csv

	cd ..

	echo change to main 
	echo `pwd`
	
	bg_util=` python -c "print $bg_util + 0.2 "`
	counter=$(( $counter + 1 ))
done

echo DEADLINE RUN 1 COMPLETED FOR PERIOD = 300


#PERIOD= 1.25x

bg_util=0.2

counter=1


while [ $counter -le 4 ]
do
	declare -a pids

	echo bg_util is $bg_util
	
	echo `pwd`

	#fg_util=` python -c "print (1 -  $bg_util)"`
	#echo FG Util is $fg_util

	bg_period=` python -c "print ( 0.95 - $bg_util ) / $bg_util * 375.0 " `


	rm bg_resp.txt
	touch bg_resp.txt
	
	

	sudo gcc -o dead_bg_job	dead_bg_job.c
	sudo gcc -o dead_loader dead_bg_controller.c
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &	
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &        


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
	sudo ./dead_controller 0 1.25 1 &
	pids[0]=$!

	cd ../wl2
	sudo ./dead_controller 0 1.25 1 &
	pids[1]=$!

	cd ../wl3
	sudo ./dead_controller 0 1.25 1 &
	pids[2]=$!

	cd ../wl4
	sudo ./dead_controller 0 1.25 1 &
	pids[3]=$!

	cd ../wl5
	sudo ./dead_controller 0 1.25 1 &
	pids[4]=$!

	cd ../wl6
	sudo ./dead_controller 0 1.25 1 &
	pids[5]=$!

	cd ../wl7
	sudo ./dead_controller 0 1.25 1 &
	pids[6]=$!

	cd ../wl8
	sudo ./dead_controller 0 1.25 1 &
	pids[7]=$!

	

	for pid in ${pids[*]}; do
		echo $pid
    	wait $pid
	done


	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_jobs
	sudo killall dead_loader
	sudo killall dead_bg_job
	echo `pwd`

	cd ..
	mv bg_resp.txt bg/375_deadline_bg_vary/bg_$bg_util.csv

	cd wl1
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl2
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl3
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl4
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl5
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl6
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl7
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl8
	mv wl_resp.txt 375_deadline_bg_vary/fg_$bg_util.csv

	cd ..

	echo change to main 
	echo `pwd`
	
	bg_util=` python -c "print $bg_util + 0.2 "`
	counter=$(( $counter + 1 ))
done

echo DEADLINE RUN 1 COMPLETED FOR PERIOD = 375

#PERIOD= 1.5x

bg_util=0.2

counter=1


while [ $counter -le 4 ]
do
	declare -a pids

	echo bg_util is $bg_util
	
	echo `pwd`

	#fg_util=` python -c "print (1 -  $bg_util)"`
	#echo FG Util is $fg_util

	bg_period=` python -c "print ( 0.95 - $bg_util ) / $bg_util * 450.0 " `


	rm bg_resp.txt
	touch bg_resp.txt
	
	

	sudo gcc -o dead_bg_job	dead_bg_job.c
	sudo gcc -o dead_loader dead_bg_controller.c
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &	
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &        


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
	sudo ./dead_controller 0 1.5 1 &
	pids[0]=$!

	cd ../wl2
	sudo ./dead_controller 0 1.5 1 &
	pids[1]=$!

	cd ../wl3
	sudo ./dead_controller 0 1.5 1 &
	pids[2]=$!

	cd ../wl4
	sudo ./dead_controller 0 1.5 1 &
	pids[3]=$!

	cd ../wl5
	sudo ./dead_controller 0 1.5 1 &
	pids[4]=$!

	cd ../wl6
	sudo ./dead_controller 0 1.5 1 &
	pids[5]=$!

	cd ../wl7
	sudo ./dead_controller 0 1.5 1 &
	pids[6]=$!

	cd ../wl8
	sudo ./dead_controller 0 1.5 1 &
	pids[7]=$!

	

	for pid in ${pids[*]}; do
		echo $pid
    	wait $pid
	done


	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_jobs
	sudo killall dead_loader
	sudo killall dead_bg_job
	echo `pwd`

	cd ..
	mv bg_resp.txt bg/450_deadline_bg_vary/bg_$bg_util.csv

	cd wl1
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl2
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl3
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl4
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl5
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl6
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl7
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl8
	mv wl_resp.txt 450_deadline_bg_vary/fg_$bg_util.csv

	cd ..

	echo change to main 
	echo `pwd`
	
	bg_util=` python -c "print $bg_util + 0.2 "`
	counter=$(( $counter + 1 ))
done

echo DEADLINE RUN 1 COMPLETED FOR PERIOD = 450


#PERIOD= 1.75x

bg_util=0.2

counter=1


while [ $counter -le 4 ]
do
	declare -a pids

	echo bg_util is $bg_util
	
	echo `pwd`

	#fg_util=` python -c "print (1 -  $bg_util)"`
	#echo FG Util is $fg_util

	bg_period=` python -c "print ( 0.95 - $bg_util ) / $bg_util * 525.0 " `


	rm bg_resp.txt
	touch bg_resp.txt
	
	

	sudo gcc -o dead_bg_job	dead_bg_job.c
	sudo gcc -o dead_loader dead_bg_controller.c
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &	
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &        


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
	sudo ./dead_controller 0 1.75 1 &
	pids[0]=$!

	cd ../wl2
	sudo ./dead_controller 0 1.75 1 &
	pids[1]=$!

	cd ../wl3
	sudo ./dead_controller 0 1.75 1 &
	pids[2]=$!

	cd ../wl4
	sudo ./dead_controller 0 1.75 1 &
	pids[3]=$!

	cd ../wl5
	sudo ./dead_controller 0 1.75 1 &
	pids[4]=$!

	cd ../wl6
	sudo ./dead_controller 0 1.75 1 &
	pids[5]=$!

	cd ../wl7
	sudo ./dead_controller 0 1.75 1 &
	pids[6]=$!

	cd ../wl8
	sudo ./dead_controller 0 1.75 1 &
	pids[7]=$!

	

	for pid in ${pids[*]}; do
		echo $pid
    	wait $pid
	done


	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_jobs
	sudo killall dead_loader
	sudo killall dead_bg_job
	echo `pwd`

	cd ..
	mv bg_resp.txt bg/525_deadline_bg_vary/bg_$bg_util.csv

	cd wl1
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl2
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl3
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl4
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl5
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl6
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl7
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl8
	mv wl_resp.txt 525_deadline_bg_vary/fg_$bg_util.csv

	cd ..

	echo change to main 
	echo `pwd`
	
	bg_util=` python -c "print $bg_util + 0.2 "`
	counter=$(( $counter + 1 ))
done

echo DEADLINE RUN 1 COMPLETED FOR PERIOD = 525


#PERIOD= 2x

bg_util=0.2

counter=1


while [ $counter -le 4 ]
do
	declare -a pids

	echo bg_util is $bg_util
	
	echo `pwd`

	#fg_util=` python -c "print (1 -  $bg_util)"`
	#echo FG Util is $fg_util

	bg_period=` python -c "print ( 0.95 - $bg_util ) / $bg_util * 600.0 " `


	rm bg_resp.txt
	touch bg_resp.txt
	
	

	sudo gcc -o dead_bg_job	dead_bg_job.c
	sudo gcc -o dead_loader dead_bg_controller.c
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &	
	sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &
    sudo ./dead_loader $bg_util $bg_period &        


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
	sudo ./dead_controller 0 2 1 &
	pids[0]=$!

	cd ../wl2
	sudo ./dead_controller 0 2 1 &
	pids[1]=$!

	cd ../wl3
	sudo ./dead_controller 0 2 1 &
	pids[2]=$!

	cd ../wl4
	sudo ./dead_controller 0 2 1 &
	pids[3]=$!

	cd ../wl5
	sudo ./dead_controller 0 2 1 &
	pids[4]=$!

	cd ../wl6
	sudo ./dead_controller 0 2 1 &
	pids[5]=$!

	cd ../wl7
	sudo ./dead_controller 0 2 1 &
	pids[6]=$!

	cd ../wl8
	sudo ./dead_controller 0 2 1 &
	pids[7]=$!

	

	for pid in ${pids[*]}; do
		echo $pid
    	wait $pid
	done


	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_job
	sudo killall dead_loader
	sudo killall dead_bg_job
	sudo killall dead_controller
	sudo killall dead_emulate_jobs
	sudo killall dead_loader
	sudo killall dead_bg_job
	echo `pwd`

	cd ..
	mv bg_resp.txt bg/600_deadline_bg_vary/bg_$bg_util.csv

	cd wl1
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl2
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv
	
	cd ../wl3
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl4
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl5
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl6
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl7
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv

	cd ../wl8
	mv wl_resp.txt 600_deadline_bg_vary/fg_$bg_util.csv

	cd ..

	echo change to main 
	echo `pwd`
	
	bg_util=` python -c "print $bg_util + 0.2 "`
	counter=$(( $counter + 1 ))
done

echo DEADLINE RUN 1 COMPLETED FOR PERIOD = 600

