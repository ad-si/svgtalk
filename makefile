# Alternative: `gst-doc --package SvgTalk | makeinfo --html --output docs`
docs: source/*
	gst-doc \
		--output-format HTML \
		--package SvgTalk \
		--output docs

	mv docs/classes.html docs/index.html

.PHONY: clean
clean:
	-rm -rf docs

.PHONY: test
test:
	gst-package --test ./package.xml
