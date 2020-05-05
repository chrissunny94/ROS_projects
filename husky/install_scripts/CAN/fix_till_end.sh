if [ $? -eq 1 ];then
    echo "Looks like we have a issue, lets try to fix that"
    sudo apt-get install -f
fi
