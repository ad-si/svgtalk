FileStream fileIn: './source/CssDeclaration.st'.

Rectangle subclass: SvgRect [
  "I represent an SVG rectangle"
  <category: 'Graphics'>

  | style |

  SvgRect class >> left: leftNum right: rightNum top: topNum bottom: bottomNum [
    ""
    <category: 'instance creation'>
    ^(super left: leftNum right: rightNum top: topNum bottom: bottomNum)
      initialize.
  ]

  SvgRect class >> left: leftNum top: topNum right: rightNum bottom: bottomNum [
    ""
    <category: 'instance creation'>
    ^(super left: leftNum top: topNum right: rightNum bottom: bottomNum)
      initialize.
  ]

  SvgRect class >> origin: originPoint extent: extentPoint [
    ""
    <category: 'instance creation'>
    ^(super origin: originPoint extent: extentPoint) initialize.
  ]

  SvgRect class >> origin: originPoint corner: cornerPoint [
    ""
    <category: 'instance creation'>
    ^(super origin: originPoint corner: cornerPoint) initialize.
  ]

  initialize [
    ""
    <category: 'initialization'>
    style := OrderedCollection new.
  ]

  style: aCollection [
    ""
    <category: 'accessing'>
    style := aCollection.
  ]

  asString [
    ""
    <category: 'accessing'>
    ^'<rect ',
      'x="', self topLeft x asString, '" ',
      'y="', self topLeft y asString, '" ',
      'width="', self width asString, '" ',
      'height="', self height asString, '" ',
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
