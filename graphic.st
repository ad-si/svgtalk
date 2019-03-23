rect := SvgRect origin: 10@10 corner: 400@300.


cssRuleH1 := CssRule new
  selector: 'h1';
  declarations: (#('color: green' 'margin-bottom: 2em') asOrderedCollection);
  yourself.

cssRuleH2 := CssRule new
  selector: 'h2';
  declarations: (#('color: red' 'margin-bottom: 1em') asOrderedCollection);
  yourself.

css := Css new
  rules: (OrderedCollection new add: cssRuleH1; add: cssRuleH2; yourself).


svg := Svg new
  children: (OrderedCollection new add: rect; yourself);
  style: css;
  yourself.

svg printNl.
