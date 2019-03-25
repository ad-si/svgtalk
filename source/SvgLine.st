FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgLine [
  <category: 'Graphics'>
  <comment: 'I represent an SVG line'>

  | start end style |

  initialize [
    <category: 'initialization'>
    style := OrderedCollection new.
    start := 0@0.
    end := 0@0.
  ]

  style: aCollection [ style := aCollection. ]
  start: aPoint [ start := aPoint. ]
  end: aPoint [ end := aPoint. ]

  asString [
    ^'<line ',
      'x1="', start x asString, '" ',
      'y1="', start y asString, '" ',
      'x2="', end x asString, '" ',
      'y2="', end y asString, '" ',
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
