FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: MoveCommand [
  "I represent an SVG draw command for path elements"
  <category: 'Graphics'>
  | x y |

  initialize [
    ""
    <category: 'initialization'>
    x := 0.
    y := 0.
  ]

  x: aNumber [
    ""
    <category: 'accessing'>
    x := aNumber.
  ]

  y: aNumber [
    ""
    <category: 'accessing'>
    y := aNumber.
  ]
]

MoveCommand subclass: MoveAbsCommand [
  "I represent an absolute SVG draw command for path elements"
  <category: 'Graphics'>
  asString [
    ""
    <category: 'accessing'>
    ^'M', x asString, ',', y asString
  ]
]

MoveCommand subclass: MoveRelCommand [
  <category: 'Graphics'>
  "I represent an relative SVG draw command for path elements"
  asString [
    ""
    <category: 'accessing'>
    ^'m', x asString, ',', y asString
  ]
]


Object subclass: LineCommand [
  <category: 'Graphics'>
  "I represent an SVG line command for path elements"
  | x y |

  initialize [
    ""
    <category: 'initialization'>
    x := 0.
    y := 0.
  ]

  x: aNumber [
    ""
    <category: 'accessing'>
    x := aNumber.
  ]

  y: aNumber [
    ""
    <category: 'accessing'>
    y := aNumber.
  ]
]

LineCommand subclass: LineAbsCommand [
  "I represent an absolute SVG line command for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'L', x asString, ',', y asString
  ]
]

LineCommand subclass: LineRelCommand [
  "I represent a relative SVG line command for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'l', x asString, ',', y asString
  ]
]


Object subclass: HorizontalLineCommand [
  "I represent an SVG horizontal line command for path elements"
  <category: 'Graphics'>

  | x |
  initialize [
    <category: 'initialization'> x := 0. ]
  x: aNumber [
    ""
    <category: 'accessing'>
    x := aNumber. ]
]

HorizontalLineCommand subclass: HorizontalLineAbsCommand [
  "I represent an absolute SVG horizontal line comma for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'H', x asString
  ]
]

HorizontalLineCommand subclass: HorizontalLineRelCommand [
  "I represent a relative SVG horizontal line comma for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'h', x asString
  ]
]


Object subclass: VerticalLineCommand [
  "I represent an SVG vertical line command for path elements"
  <category: 'Graphics'>

  | y |
  initialize [
    <category: 'initialization'> y := 0. ]
  y: aNumber [
    ""
    <category: 'accessing'>
    y := aNumber. ]
]

VerticalLineCommand subclass: VerticalLineAbsCommand [
  "I represent an absolute SVG vertical line comma for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'V', y asString
  ]
]

VerticalLineCommand subclass: VerticalLineRelCommand [
  "I represent a relative SVG vertical line comma for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'v', y asString
  ]
]


Object subclass: CloseCommand [
  "I represent an SVG close command for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'z' ]
]


Object subclass: CurveCommand [
  "I represent an SVG curve command for path elements"
  <category: 'Graphics'>

  | control1 control2 end |

  initialize [
    ""
    <category: 'initialization'>
    control1 := 0@0.
    control2 := 0@0.
    end := 0@0.
  ]

  control1: aPoint [
    ""
    <category: 'accessing'>
    control1 := aPoint.
  ]

  control2: aPoint [
    ""
    <category: 'accessing'>
    control2 := aPoint.
  ]

  end: aPoint [
    ""
    <category: 'accessing'>
    end := aPoint.
  ]
]

CurveCommand subclass: CurveAbsCommand [
  "I represent an absolute SVG curve command for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'C',
    control1 x asString, ',', control1 y asString, ' ',
    control2 x asString, ',', control2 y asString, ' ',
    end x asString, ',', end y asString.
  ]
]

CurveCommand subclass: CurveRelCommand [
  "I represent a relative SVG curve command for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'c',
    control1 x asString, ',', control1 y asString, ' ',
    control2 x asString, ',', control2 y asString, ' ',
    end x asString, ',', end y asString.
  ]
]


Object subclass: ArcCommand [
  "I represent an SVG arc command for path elements"
  <category: 'Graphics'>

  | radiusX radiusY rotation isLargeArc isSweep x y |

  initialize [
    ""
    <category: 'initialization'>
    radiusX := 0. radiusY := 0. rotation := 0.
    isLargeArc := false. isSweep := false.
    x := 0. y := 0.
  ]

  radiusX: aNumber [
    ""
    <category: 'accessing'>
    radiusX := aNumber.
  ]

  radiusY: aNumber [
    ""
    <category: 'accessing'>
    radiusY := aNumber.
  ]

  rotation: aNumber [
    ""
    <category: 'accessing'>
    rotation := aNumber.
  ]

  isLargeArc: aBoolean [
    ""
    <category: 'accessing'>
    isLargeArc := aBoolean.
  ]

  isSweep: aBoolean [
    ""
    <category: 'accessing'>
    isSweep := aBoolean.
  ]

  x: aNumber [
    ""
    <category: 'accessing'>
    x := aNumber.
  ]

  y: aNumber [
    ""
    <category: 'accessing'>
    y := aNumber.
  ]
]

ArcCommand subclass: ArcAbsCommand [
  "I represent an absolute SVG arc command for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'A',
    radiusX asString, ',', radiusY asString, ' ', rotation asString, ' ',
    (isLargeArc ifFalse: ['0'] ifTrue: ['1']), ' ',
      (isSweep ifFalse: ['0'] ifTrue: ['1']), ' ',
    x asString, ',', y asString.
  ]
]

ArcCommand subclass: ArcRelCommand [
  "I represent a relative SVG arc command for path elements"
  <category: 'Graphics'>

  asString [
    ""
    <category: 'accessing'>
    ^'a',
    radiusX asString, ',', radiusY asString, ' ', rotation asString, ' ',
    (isLargeArc ifFalse: ['0'] ifTrue: ['1']), ' ',
      (isSweep ifFalse: ['0'] ifTrue: ['1']), ' ',
    x asString, ',', y asString.
  ]
]


Object subclass: SvgPath [
  "I represent an SVG line"
  <category: 'Graphics'>

  | drawCommands style |

  initialize [
    ""
    <category: 'initialization'>
    style := OrderedCollection new.
    drawCommands := OrderedCollection new.
  ]

  style: aCollection [
    ""
    <category: 'accessing'>
    style := aCollection.
  ]

  drawCommands: aCollection [
    ""
    <category: 'accessing'>
    drawCommands := aCollection.
  ]

  asString [
    ""
    <category: 'accessing'>

    ^'<path ',
      'd="',
        (drawCommands
          inject: ''
          into: [:result :drawCmd | result, drawCmd asString, ' ']),
        '" ',
      ((style isEmpty)
        ifTrue: ['']
        ifFalse: [
          'style="',
          (style
            inject: ''
            into: [:result :rule | result, rule asString]),
          '" '
        ]),
      '/>'.
  ]
]
