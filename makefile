docs: main.st
	gst-doc \
		--output-format HTML \
		--file main.st \
		--output docs

	mv docs/classes.html docs/index.html

	# Alternative: `gst-doc --file main.st | makeinfo --html --output docs`


clean:
	-rm -rf docs
