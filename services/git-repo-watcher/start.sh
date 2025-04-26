#!/bin/bash


# Repos to watch
repos=("https://github.com/Exodation/PAP.git")


# Base directory for cloned repos
base_dir="/opt/Docker/"


check_and_update_repo() {

  repo_url=$1

  repo_name=$(basename $repo_url .git)

  repo_dir="$base_dir/$repo_name"


  # Check if the repo folder exists
  if [ -d "$repo_dir" ]; then

    cd $repo_dir

    echo "Checking for updates in repo $repo_name..."

    # Get changes
    git fetch

    if git diff --quiet HEAD..origin/main; then

      echo "No changes in $repo_name."

    else

      # Force pull changes
      echo "Changes detected in $repo_name. Force pulling..."

      git reset --hard origin/main  

      if [ -d "$repo_dir/Docker" ]; then
        echo "Docker directory found. Running start.sh"
        cd $repo_dir/Docker
        
        chmod +x start.sh
        ./start.sh
      else
        echo "No Docker directory found in $repo_name."
      fi

    fi

  else

    # Clone repo
    echo "Repo $repo_name not found. Cloning..."

    git clone $repo_url $repo_dir
    git config --global --add safe.directory $repo_dir 
  fi

}



for repo_url in "${repos[@]}"; do

  check_and_update_repo $repo_url

done

echo 'Finished repo check'