#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

project_config_file="../project-config"
container_name=

# 加载项目配置
if [ -f "$project_config_file" ]; then
    # shellcheck source=./
    source "$project_config_file"
fi

echo Connecting to container - ${container_name}
docker exec -it ${container_name} bash
