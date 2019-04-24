PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: './source/SvgCircle.st'.
FileStream fileIn: './source/CssDeclaration.st'.

TestCase subclass: SvgCircleTest [
  testSupportForStyles [
    | circle expected |
    circle := (SvgCircle center: 1@2 radius: 3)
      style: (OrderedCollection new
        add: (CssDeclaration key: 'fill' value: 'red');
        add: (CssDeclaration key: 'stroke' value: 'green');
        yourself);
      yourself.
    expected :=
      '<circle cx="1" cy="2" r="3" style="fill: red;stroke: green;" />'.
    self assert: circle asString equals: expected.
  ]
]
