FileStream fileIn: './source/CssDeclaration.st'.

Rectangle subclass: SvgRect [
  <category: 'Graphics'>
  <comment: 'I represent an SVG rectangle'>

  | style |

  SvgRect class >> new [
    <category: 'instance creation'>
    ^super new initialize.
  ]

  SvgRect class >> left: leftNum right: rightNum top: topNum bottom: bottomNum [
    <category: 'instance creation'>
    ^(super left: leftNum right: rightNum top: topNum bottom: bottomNum)
      initialize.
  ]

  SvgRect class >> left: leftNum top: topNum right: rightNum bottom: bottomNum [
    <category: 'instance creation'>
    ^(super left: leftNum top: topNum right: rightNum bottom: bottomNum)
      initialize.
  ]

  SvgRect class >> origin: originPoint extent: extentPoint [
    <category: 'instance creation'>
    ^(super origin: originPoint extent: extentPoint) initalize.
  ]

  SvgRect class >> origin: originPoint corner: cornerPoint [
    <category: 'instance creation'>
    ^(super origin: originPoint corner: cornerPoint) initialize.
  ]

  initalize [
    <category: 'initialization'>
    style := OrderedCollection new.
  ]

  style: aCollection [ style := aCollection. ]

  asString [
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
