if [ -e dist ]; then
    echo "api has been already built"
else
    yarn build
fi
