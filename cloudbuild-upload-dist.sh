# Upload compressed */dist to GCS
#
# Run this script on a official Cloud Build image
# gcr.io/cloud-builders/gsutil

yarnlock_checksum=$(md5sum yarn.lock | cut -d ' ' -f 1)
checksum=$(git log --oneline -1 --pretty=format:'%H' -- src)

path="xapi-service/${yarnlock_checksum}-${checksum}.tar.gz"

gsutil -q stat gs://learninglocker-dev-artifact/${path}
non_exists=$?

if [ ${non_exists} -eq 0 ]; then
    echo "${path} already exists in GCS"
else
    tar czf dist.tar.gz dist
    gsutil cp dist.tar.gz gs://learninglocker-dev-artifact/${path}
    rm dist.tar.gz
    echo "Upload dist to GCS ${path}"
fi
