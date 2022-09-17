targets = all deps deps-pipgrip build build-nc clean lint lint-deps \
          scan-config scan-config-deps scan-filesystem scan-image prune push \
          test update-base-image

${targets}:
	redo $@

.PHONY: ${targets}
