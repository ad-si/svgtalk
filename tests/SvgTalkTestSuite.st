PackageLoader fileInPackage: 'SUnit'.
FileStream fileIn: 'tests/CssTest.st'.
FileStream fileIn: 'tests/SvgRectTest.st'.

TestSuite subclass: SvgTalkTestSuite [
  SvgTalkTestSuite class >> suite [
    ^super new.
  ]

  initialize [
    self name: 'SvgTalk Test'.
    self addTest: (SvgRectTest selector: #testInstantiation).
    self addTest: (SvgRectTest selector: #testSupportForStyles).
    self addTest: (CssTest selector: #testInstantiation).
  ]
]
