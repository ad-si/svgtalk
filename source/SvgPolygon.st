FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgPolygon [
  <category: 'Graphics'>
  <comment: 'I represent an SVG line'>

  | points style |

  initialize [
    <category: 'initialization'>
    style := OrderedCollection new.
    points := OrderedCollection new.
  ]

  style: aCollection [ style := aCollection. ]
  points: aCollection [ points := aCollection. ]

  asString [
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
