# Download */dist from GCS
#
# Run this script on a official Cloud Build image
# gcr.io/cloud-builders/gsutil

yarnlock_checksum=$(md5sum yarn.lock | cut -d ' ' -f 1)
checksum=$(git log --oneline -1 --pretty=format:'%H' -- src)

path="xapi-service/${yarnlock_checksum}-${checksum}.tar.gz"

gsutil -q stat gs://learninglocker-dev-artifact/${path}
non_exists=$?

if [ ${non_exists} -eq 1 ]; then
    echo "${path} is not exist in GCS"
else
    echo "Download dist from GCS"
    gsutil cp gs://learninglocker-dev-artifact/${path} dist.tar.gz
    tar xzf dist.tar.gz
    rm dist.tar.gz
fi
