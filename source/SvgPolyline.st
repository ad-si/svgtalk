FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgPolyline [
  "I represent an SVG polyline"
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

    ^'<polyline ',
      'points="', (points
        inject: ''
        into: [:result :point |
          result, point x asString, ',', point y asString, ' ']), '" ',
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
