# see process that 5000 port 
lsof -t -i:5000

# see process that 3000 port
lsof -t -i:3000

# kill process with that process_id
sudo kill -9 $process_id 


# all complete in one line
kill -9 $(lsof -ti:3000)
