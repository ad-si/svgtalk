FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: MoveCommand [
  <category: 'Graphics'>
  <comment: 'I represent an SVG draw command for path elements'>
  | x y |
  initialize [ <category: 'initialization'> x := 0. y := 0. ]
  x: aNumber [ x := aNumber. ]
  y: aNumber [ y := aNumber. ]
]

MoveCommand subclass: MoveAbsCommand [
  <category: 'Graphics'>
  <comment: 'I represent an absolute SVG draw command for path elements'>
  asString [ ^'M', x asString, ',', y asString ]
]

MoveCommand subclass: MoveRelCommand [
  <category: 'Graphics'>
  <comment: 'I represent an relative SVG draw command for path elements'>
  asString [ ^'m', x asString, ',', y asString ]
]


Object subclass: LineCommand [
  <category: 'Graphics'>
  <comment: 'I represent an SVG line command for path elements'>
  | x y |
  initialize [ <category: 'initialization'> x := 0. y := 0. ]
  x: aNumber [ x := aNumber. ]
  y: aNumber [ y := aNumber. ]
]

LineCommand subclass: LineAbsCommand [
  <category: 'Graphics'>
  <comment: 'I represent an absolute SVG line command for path elements'>
  asString [ ^'L', x asString, ',', y asString ]
]

LineCommand subclass: LineRelCommand [
  <category: 'Graphics'>
  <comment: 'I represent a relative SVG line command for path elements'>
  asString [ ^'l', x asString, ',', y asString ]
]


Object subclass: HorizontalLineCommand [
  <category: 'Graphics'>
  <comment: 'I represent an SVG horizontal line command for path elements'>
  | x |
  initialize [ <category: 'initialization'> x := 0. ]
  x: aNumber [ x := aNumber. ]
]

HorizontalLineCommand subclass: HorizontalLineAbsCommand [
  <category: 'Graphics'>
  <comment: 'I represent an absolute SVG horizontal line command
    for path elements'>
  asString [ ^'H', x asString ]
]

HorizontalLineCommand subclass: HorizontalLineRelCommand [
  <category: 'Graphics'>
  <comment: 'I represent a relative SVG horizontal line command
    for path elements'>
  asString [ ^'h', x asString ]
]


Object subclass: VerticalLineCommand [
  <category: 'Graphics'>
  <comment: 'I represent an SVG vertical line command for path elements'>
  | y |
  initialize [ <category: 'initialization'> y := 0. ]
  y: aNumber [ y := aNumber. ]
]

VerticalLineCommand subclass: VerticalLineAbsCommand [
  <category: 'Graphics'>
  <comment: 'I represent an absolute SVG vertical line command
    for path elements'>
  asString [ ^'V', y asString ]
]

VerticalLineCommand subclass: VerticalLineRelCommand [
  <category: 'Graphics'>
  <comment: 'I represent a relative SVG vertical line command
    for path elements'>
  asString [ ^'v', y asString ]
]


Object subclass: CloseCommand [
  <category: 'Graphics'>
  <comment: 'I represent an SVG close command for path elements'>
  asString [ ^'z' ]
]


Object subclass: CurveCommand [
  <category: 'Graphics'>
  <comment: 'I represent an SVG curve command for path elements'>
  | control1 control2 end |
  initialize [ <category: 'initialization'>
    control1 := 0@0. control2 := 0@0. end := 0@0. ]
  control1: aPoint [ control1 := aPoint. ]
  control2: aPoint [ control2 := aPoint. ]
  end: aPoint [ end := aPoint. ]
]

CurveCommand subclass: CurveAbsCommand [
  <category: 'Graphics'>
  <comment: 'I represent an absolute SVG curve command for path elements'>
  asString [ ^'C',
    control1 x asString, ',', control1 y asString, ' ',
    control2 x asString, ',', control2 y asString, ' ',
    end x asString, ',', end y asString.
  ]
]

CurveCommand subclass: CurveRelCommand [
  <category: 'Graphics'>
  <comment: 'I represent a relative SVG curve command for path elements'>
  asString [ ^'c',
    control1 x asString, ',', control1 y asString, ' ',
    control2 x asString, ',', control2 y asString, ' ',
    end x asString, ',', end y asString.
  ]
]


Object subclass: ArcCommand [
  <category: 'Graphics'>
  <comment: 'I represent an SVG arc command for path elements'>
  | radiusX radiusY rotation isLargeArc isSweep x y |
  initialize [ <category: 'initialization'>
    radiusX := 0. radiusY := 0. rotation := 0.
    isLargeArc := false. isSweep := false.
    x := 0. y := 0.
    ]
  radiusX: aNumber [ radiusX := aNumber. ]
  radiusY: aNumber [ radiusY := aNumber. ]
  rotation: aNumber [ rotation := aNumber. ]
  isLargeArc: aBoolean [ isLargeArc := aBoolean. ]
  isSweep: aBoolean [ isSweep := aBoolean. ]
  x: aNumber [ x := aNumber. ]
  y: aNumber [ y := aNumber. ]
]

ArcCommand subclass: ArcAbsCommand [
  <category: 'Graphics'>
  <comment: 'I represent an absolute SVG arc command for path elements'>
  asString [ ^'A',
    radiusX asString, ',', radiusY asString, ' ', rotation asString, ' ',
    (isLargeArc ifFalse: ['0'] ifTrue: ['1']), ' ',
      (isSweep ifFalse: ['0'] ifTrue: ['1']), ' ',
    x asString, ',', y asString.
  ]
]

ArcCommand subclass: ArcRelCommand [
  <category: 'Graphics'>
  <comment: 'I represent a relative SVG arc command for path elements'>
  asString [ ^'a',
    radiusX asString, ',', radiusY asString, ' ', rotation asString, ' ',
    (isLargeArc ifFalse: ['0'] ifTrue: ['1']), ' ',
      (isSweep ifFalse: ['0'] ifTrue: ['1']), ' ',
    x asString, ',', y asString.
  ]
]


Object subclass: SvgPath [
  <category: 'Graphics'>
  <comment: 'I represent an SVG line'>

  | drawCommands style |

  initialize [
    <category: 'initialization'>
    style := OrderedCollection new.
    drawCommands := OrderedCollection new.
  ]

  style: aCollection [ style := aCollection. ]
  drawCommands: aCollection [ drawCommands := aCollection. ]

  asString [
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
