PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: './source/SvgPolygon.st'.
FileStream fileIn: './source/CssDeclaration.st'.

TestCase subclass: SvgPolygonTest [
  testSupportForStyles [
    | line expected |
    line := SvgPolygon new
      points: (OrderedCollection new
        add: 1@2;
        add: 3@4;
        add: 5@6;
        yourself);
      style: (OrderedCollection new
        add: (CssDeclaration key: 'stroke' value: 'green');
        yourself);
      yourself.
    expected := '<polygon points="1,2 3,4 5,6 " style="stroke: green;" />'.
    self assert: line asString equals: expected.
  ]
]
