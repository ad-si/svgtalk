background := (SvgRect origin: 0@0 extent: 200@100)
  style: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'lightgray');
    yourself).

rect := (SvgRect origin: 30@10 extent: 40@30)
  style: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'red');
    yourself).

circle := SvgCircle center: 100@20 radius: 10.

ellipse := SvgEllipse new
  center: 140@20;
  radiusX: 20;
  radiusY: 10;
  style: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'blue');
    yourself).

polygon := SvgPolygon new
  points: (OrderedCollection new
    add: 70@60;
    add: 90@90;
    add: 110@70;
    yourself);
  style: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'transparent');
    add: (CssDeclaration key: 'stroke' value: 'orange');
    add: (CssDeclaration key: 'stroke-width' value: '5px');
    yourself);
  yourself.

circleStyle := CssRule new
  selector: 'circle';
  declarations: (OrderedCollection new
    add: (CssDeclaration key: 'fill' value: 'green');
    yourself);
  yourself.

css := Css new
  rules: (OrderedCollection new add: circleStyle; yourself).


svg := Svg new
  children: (OrderedCollection new
    add: background;
    add: rect;
    add: circle;
    add: ellipse;
    add: polygon;
    yourself);
  style: css;
  yourself.


svg printNl.
