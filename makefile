# Alternative: `gst-doc --package SvgTalk | makeinfo --html --output docs`
docs: source/* package.xml
	gst-package ./package.xml

	gst-doc \
		--output-format HTML \
		--package SvgTalk \
		--output docs

	mv docs/classes.html docs/index.html

graphic.svg: graphic.st
	gst source/*.st $< > $@

.PHONY: clean
clean:
	-rm -rf docs

.PHONY: test
test:
	gst-package --test ./package.xml
