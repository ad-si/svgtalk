PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: './source/SvgLine.st'.
FileStream fileIn: './source/CssDeclaration.st'.

TestCase subclass: SvgLineTest [
  testSupportForStyles [
    | line expected |
    line := SvgLine new
      start: 1@2;
      end: 3@4;
      style: (OrderedCollection new
        add: (CssDeclaration key: 'stroke' value: 'green');
        yourself);
      yourself.
    expected :=
      '<line x1="1" y1="2" x2="3" y2="4" style="stroke: green;" />'.
    self assert: line asString equals: expected.
  ]
]
