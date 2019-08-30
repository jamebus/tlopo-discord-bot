targets = all build build-nc clean lint prune push tag test

${targets}:
	redo $@

.PHONY: ${targets}
