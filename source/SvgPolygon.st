FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgPolygon [
  "I represent an SVG polygon"
  <category: 'Graphics'>

  | points style |

  initialize [
    ""
    <category: 'initialization'>
    style := OrderedCollection new.
    points := OrderedCollection new.
  ]

  style: aCollection [
    ""
    <category: 'accessing'>
    style := aCollection.
  ]

  points: aCollection [
    ""
    <category: 'accessing'>
    points := aCollection.
  ]

  asString [
    ""
    <category: 'accessing'>
    ^'<polygon ',
      'points="',
        (points
          inject: ''
          into: [:result :point |
            result, point x asString, ',', point y asString, ' ']),
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
