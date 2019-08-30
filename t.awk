/@JO_VERSION@/ {
	gsub(/@JO_VERSION@/, jo_version)
}
/@JO_DIST_URL@/ {
	gsub(/@JO_DIST_URL@/, jo_dist_url)
}
/@JO_DIST_SHA256@/ {
	gsub(/@JO_DIST_SHA256@/, jo_dist_sha256)
}
/@PYTHON_DEPENDENCIES@/ {
	gsub(/@PYTHON_DEPENDENCIES@/, python_dependencies)
}
{ print }
