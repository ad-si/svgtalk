FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgLine [
  "I represent an SVG line"
  <category: 'Graphics'>

  | start end style |

  initialize [
    "Answer the 0@0 -- 0@0 line"
    <category: 'initialization'>
    style := OrderedCollection new.
    start := 0@0.
    end := 0@0.
  ]

  style: aCollection [
    "Set the receiver's style to a collection of CssRule objects"
	  <category: 'accessing'>
    style := aCollection.
  ]

  start: aPoint [
    "Set the receiver's start point"
    <category: 'accessing'>
    start := aPoint.
  ]

  end: aPoint [
    "Set the receiver's end point"
    <category: 'accessing'>
    end := aPoint.
  ]

  asString [
    "Answer the SVG representation of the line"
    <category: 'accessing'>
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
