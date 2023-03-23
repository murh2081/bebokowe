#!/bin/bash

echo -n "name the luzer: "
read name

if [ ! -z $name ]
then
  if ! id -u $name > /dev/null 2>&1;
  then
    useradd -m $name
    passwd $name
    su - $name -c "mkdir /home/$name/public_html/"
    su - $name -c "chmod 711 /home/$name/"
    su - $name -c "chmod 755 /home/$name/public_html/"
    su - $name -c "echo 'edit your ~/public_html/index.html file, $name!' > /home/$name/public_html/index.html"
    echo "luzer's account is ready"
  else
    echo "luzer $name exists"
  fi
else
  echo "no name no luzer ;P"
fi
