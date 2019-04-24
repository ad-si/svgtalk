FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgCircle [
  "I represent an SVG circle"
  <category: 'Graphics'>

  | center radius style |

  initialize [
    ""
    <category: 'initialization'>
    center := 0@0.
    radius := 1.
    style := OrderedCollection new.
  ]

  SvgCircle class >> center: aPoint radius: aNumber [
    ""
    <category: 'initialization'>
    ^(super new) initialize
      center: aPoint;
      radius: aNumber.
  ]

  center: aPoint [
    ""
    <category: 'accessing'>
    center := aPoint.
  ]

  radius: aNumber [
    ""
    <category: 'accessing'>
    radius := aNumber.
  ]

  style: aCollection [
    ""
    <category: 'accessing'>
    style := aCollection.
  ]

  asString [
    ""
    <category: 'accessing'>

    ^'<circle ',
      'cx="', center x asString, '" ',
      'cy="', center y asString, '" ',
      'r="', radius asString, '" ',
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
