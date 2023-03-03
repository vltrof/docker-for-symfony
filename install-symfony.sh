#!/bin/bash
# Use script inside php container!

installSymfony() { 
  #Remove current git repo (docker-for-symfony) and install clear one for your project
  rm -rf .git 
  rm README.md
  git init &> /dev/null

  composer create-project symfony/skeleton ./tmp &> /dev/null

  # Add our .gitignore rules to symfony standard one
  echo "" >> ./tmp/.gitignore
  echo "###> project gitignore" >> ./tmp/.gitignore
  cat .gitignore >> ./tmp/.gitignore
  echo "" >> ./tmp/.gitignore
  echo "###< project gitignore" >> ./tmp/.gitignore
  rm .gitignore

  mv tmp/* ./
  mv tmp/.gitignore ./
  mv tmp/.env ./
  rmdir ./tmp

  # Change access right for www-data to access files
  chown -R www-data ./*
  chown -R www-data ./.*

  # Deleting script after usage
  rm -- "$0"
}

loadingAnimation() {
  while kill -0 $! 2>/dev/null; do
    echo -ne "Installing.\r" && sleep 0.5
    echo -ne "Installing..\r" && sleep 0.5
    echo -ne "Installing...\r" &&  sleep 0.5
    echo -ne "Installing\r" &&  sleep 0.5
    echo -ne "\r\033[K"
  done
  echo "Installing... completed!"
}

installSymfony & loadingAnimation