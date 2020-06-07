project:
	make carthage_bootstrap
	xcodegen generate --spec project.yml --use-cache

carthage_bootstrap:
	carthage bootstrap --platform iOS --cache-builds