project:
	make carthage_bootstrap
	xcodegen generate --spec project.yml --use-cache

carthage_bootstrap:
	carthage bootstrap --platform iOS --cache-builds

newproject:
ifndef NAME
	$(error Usage: make newproject NAME=NewProjectName)
endif

	mkdir Projects/$$NAME
	touch Projects/$$NAME/project.yml
	echo "targets:\n" \
		" $(NAME):\n" \
		"   templates: [Framework]\n" \
		"\n" \
		" $(NAME)Tests:\n" \
		"   templates: [UnitTest]\n" \
		"   templateAttributes:\n" \
		"     testTarget: $(NAME)" \
		>> Projects/$$NAME/project.yml

	mkdir Projects/$$NAME/Sources
	mkdir Projects/$$NAME/Tests

	@echo "Don't forget to include 'Projects/$(NAME)/project.yml'"
