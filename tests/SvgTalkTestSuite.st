PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: 'tests/CssTest.st'.
FileStream fileIn: 'tests/SvgRectTest.st'.
FileStream fileIn: 'tests/SvgCircleTest.st'.
FileStream fileIn: 'tests/SvgEllipseTest.st'.
FileStream fileIn: 'tests/SvgLineTest.st'.

TestSuite subclass: SvgTalkTestSuite [
  SvgTalkTestSuite class >> suite [
    ^super new.
  ]

  initialize [
    self name: 'SvgTalk Test'.
    self addTest: (SvgRectTest selector: #testInstantiation).
    self addTest: (SvgRectTest selector: #testSupportForStyles).

    self addTest: (SvgCircleTest selector: #testSupportForStyles).

    self addTest: (SvgEllipseTest selector: #testSupportForStyles).

    self addTest: (SvgLineTest selector: #testSupportForStyles).

    self addTest: (CssTest selector: #testInstantiation).
  ]
]
