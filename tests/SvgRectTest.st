PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: './source/SvgRect.st'.
FileStream fileIn: './source/CssDeclaration.st'.

TestCase subclass: SvgRectTest [
  testInstantiation [
    | rect expected |
    rect := SvgRect origin: 1@2 extent: 30@40.
    expected := '<rect x="1" y="2" width="30" height="40" />'.
    self assert: rect asString equals: expected.
  ]

  testSupportForStyles [
    | rect expected |
    rect := SvgRect new origin: 1@2 extent: 30@40;
      style: (OrderedCollection new
        add: (CssDeclaration key: 'fill' value: 'red');
        add: (CssDeclaration key: 'stroke' value: 'green');
        yourself);
      yourself.
    expected :=
      '<rect x="1" y="2" width="30" height="40" ',
      'style="fill: red;stroke: green;" />'.
    self assert: rect asString equals: expected.
  ]
]
