rect := SvgRect new origin: 10@10 extent: 400@300;
  style: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'red');
    yourself).

circle := SvgCircle new
  center: 50@60;
  radius: 20;
  style: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'green');
    yourself).

ellipse := SvgEllipse new
  center: 70@80;
  radiusX: 20;
  radiusY: 10;
  style: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'blue');
    yourself).

cssRuleH1 := CssRule new
  selector: 'h1';
  declarations: (OrderedCollection new
    add: (CssDeclaration key: 'color' value: 'green');
    add: (CssDeclaration key: 'margin-bottom' value: '2em');
    yourself);
  yourself.

cssRuleH2 := CssRule new
  selector: 'h2';
  declarations: (#('color: red' 'margin-bottom: 1em') asOrderedCollection);
  yourself.

css := Css new
  rules: (OrderedCollection new add: cssRuleH1; add: cssRuleH2; yourself).


svg := Svg new
  children: (OrderedCollection new
    add: rect;
    add: circle;
    add: ellipse;
    yourself);
  style: css;
  yourself.


svg printNl.
