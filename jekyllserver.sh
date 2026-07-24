#!/bin/bash

if [ "$(uname)" == "Linux" ]; then
  MOUNT_OPTION="Z"
else
  MOUNT_OPTION="cached"
fi

# You can set JEKYLL_IMAGE in the env to overwrite or it will default to this version
JEKYLL_IMAGE=${JEKYLL_IMAGE:-jekyll/jekyll:3}

docker stop jekyll-server 2>/dev/null
docker rm   jekyll-server 2>/dev/null


docker run -tip 4000:4000 -v $(pwd):/project:${MOUNT_OPTION} \
  -w /project \
  --name jekyll-server \
  ${JEKYLL_IMAGE} jekyll serve
