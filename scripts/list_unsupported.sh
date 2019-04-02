sed -n 's/WARNING: Pass through an unsupported instruction!//p' $1/out/*.err | sort -u
