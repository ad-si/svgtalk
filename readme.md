# SvgTalk

SVG generator implemented in [GNU Smalltalk].
Only contains a few primitives yet.
Merge requests to support more elements are very welcome.

Check out the documentation at https://ad-si.github.io/svgtalk/.

Attention: Must be run with [GNU Smalltalk] version [3.2.91].


## Usage

Build example graphic:

```sh
gst source/*.st graphic.st > graphic.svg
```

![Graphic](./graphic.svg)

Register the package:

```sh
gst-package ./package.xml
```

Run its tests and load package into main image:

```sh
gst-load -t SvgTalk
```

Start repl and create objects:

```sh
gst
st> SvgRect new origin: 1@2 extent: 30@40.
```

For more detailed usage scenarios check out the [./tests] directory.


## Run Tests

```sh
gst-package --test ./package.xml
```


## Build Documentation

```sh
make docs
```

[GNU Smalltalk]: http://smalltalk.gnu.org
[3.2.91]: http://smalltalk.gnu.org/news/gnu-smalltalk-3-2-91


## TODO

- [ ] Implement `#asString` in terms of `#printOn`
    (https://stackoverflow.com/questions/55322402)
