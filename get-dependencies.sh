#!/bin/bash

#Some service 
srv_get_version=$(curl --header "PRIVATE-TOKEN: ${GET_DEPS_TOKEN}" "${CI_API_V4_URL}/projects/${NG_LIBS_PROJECT_ID}/pipelines/?ref=master&status=success&scope=finished") 
srv_version=$( jq -c '.[0].id' <<< "${srv_get_version}" ) 
echo SRV_VERSION=${ng_libs_version} >> versions.env
