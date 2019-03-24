PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: './source/CssRule.st'.
FileStream fileIn: './source/Css.st'.

TestCase subclass: CssTest [
  testInstantiation [
    | cssRuleH1 cssRuleH2 css expected |

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

    expected :=
      'h1 {', Character nl asString,
      'color: green;margin-bottom: 2em;}', Character nl asString,
      'h2 {', Character nl asString,
      'color: redmargin-bottom: 1em}', Character nl asString.

    self assert: css asString equals: expected.
  ]
]
