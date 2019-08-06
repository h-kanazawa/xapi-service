if [ -e dist ]; then
    echo "dist has been already built"
else
    yarn build
fi
