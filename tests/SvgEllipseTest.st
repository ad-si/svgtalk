PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: './source/SvgEllipse.st'.
FileStream fileIn: './source/CssDeclaration.st'.

TestCase subclass: SvgEllipseTest [
  testSupportForStyles [
    | ellipse expected |
    ellipse := SvgEllipse new
      center: 1@2;
      radiusX: 3;
      radiusY: 4;
      style: (OrderedCollection new
        add: (CssDeclaration key: 'fill' value: 'red');
        yourself);
      yourself.
    expected :=
      '<ellipse cx="1" cy="2" rx="3" ry="4" style="fill: red;" />'.
    self assert: ellipse asString equals: expected.
  ]
]
