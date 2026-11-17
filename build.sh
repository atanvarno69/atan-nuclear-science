#!/usr/bin/env sh

root_path="$(cd -- "$(dirname "${0}")" >/dev/null 2>&1; pwd -P)"
build_path="${root_path}/build"
info="${root_path}/src/info.json"
output_name="$(jq -r .name "${info}")_$(jq -r .version "${info}")"
archive="${output_name}.zip"

[ ! -d "${build_path}" ] && mkdir -p "${build_path}"

# Safety checks before we even try to rm -rf...
if [ -z "$build_path" ]; then
    exit 1
fi
if [ -z "$output_name" ]; then
    exit 1
fi

[ -f "${build_path}/${archive}" ] && rm "${build_path}/${archive}"
[ -f "${build_path}/${output_name}" ] && rm -rf "${build_path}/${output_name}"

mkdir "${build_path}/${output_name}"
cp -r ${root_path}/src/* "${build_path}/${output_name}"
cp "${root_path}/LICENSE.md" "${build_path}/${output_name}/"
cd "${build_path}"
zip -9 -r "${archive}" "${output_name}"
