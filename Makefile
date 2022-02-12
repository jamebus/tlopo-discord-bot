targets = all build build-nc clean lint scan-filesystem scan-image prune push \
          test update-base-image

${targets}:
	redo $@

.PHONY: ${targets}
