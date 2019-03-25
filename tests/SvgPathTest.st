PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: './source/SvgPath.st'.
FileStream fileIn: './source/CssDeclaration.st'.

TestCase subclass: SvgPathTest [
  testSupportForStyles [
    | line expected |
    line := SvgPath new
      drawCommands: (OrderedCollection new
        add: (MoveAbsCommand new x: 2; y: 3; yourself);
        add: (LineAbsCommand new x: 4; y: 5; yourself);
        add: (LineRelCommand new x: 4; y: 5; yourself);
        add: (CurveAbsCommand new
          control1: 1@2;
          control2: 3@4;
          end: 5@6;
          yourself);
        add: (CurveRelCommand new
          control1: 1@2;
          control2: 3@4;
          end: 5@6;
          yourself);
        add: (ArcAbsCommand new
          radiusX: 1;
          radiusY: 2;
          rotation: 30;
          isLargeArc: true;
          isSweep: true;
          x: 1;
          y: 2;
          yourself);
        add: (ArcRelCommand new
          radiusX: 3;
          radiusY: 4;
          rotation: 40;
          isLargeArc: false;
          isSweep: false;
          x: 3;
          y: 4;
          yourself);
        add: (CloseCommand new);
        yourself);
      style: (OrderedCollection new
        add: (CssDeclaration key: 'stroke' value: 'green');
        yourself);
      yourself.
    expected := '<path ',
      'd="M2,3 L4,5 l4,5 C1,2 3,4 5,6 c1,2 3,4 5,6 ',
        'A1,2 30 1 1 1,2 a3,4 40 0 0 3,4 z " ',
      'style="stroke: green;" />'.
    self assert: line asString equals: expected.
  ]
]
