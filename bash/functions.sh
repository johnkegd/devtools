## list process and  check the first column and kill the PID - but it has an error xd
ps | awk '{if($1 != "PID") print $1}' | xargs kill -9

## list procress and compare the column where the app name is if it has the keyword Password and print it
ps aux | awk '{if(index($11, "Password") != 0) print $11}'
