echo 'Vestige tools running fine'

cd /opt/VestigeTools/
git fetch

    if git diff --quiet HEAD..origin/main; then

      echo "You are up to date"

    else

      echo "There is a more recent version. Run vestige-tools update to install"
    fi