FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgEllipse [
  "I represent an SVG circle"
  <category: 'Graphics'>

  | center radiusX radiusY style |

  initialize [
    ""
    <category: 'initialization'>
    center := 0@0.
    radiusX := 1.
    radiusY := 2.
    style := OrderedCollection new.
  ]

  center: aPoint [
    ""
    <category: 'accessing'>
    center := aPoint.
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

  style: aCollection [
    ""
    <category: 'accessing'>
    style := aCollection.
  ]

  asString [
    ""
    <category: 'accessing'>

    ^'<ellipse ',
      'cx="', center x asString, '" ',
      'cy="', center y asString, '" ',
      'rx="', radiusX asString, '" ',
      'ry="', radiusY asString, '" ',
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
