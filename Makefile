targets = all build build-nc clean lint prune push test update-base-image

${targets}:
	redo $@

.PHONY: ${targets}
