Object subclass: Svg [
  <category: 'Graphics'>
  <comment: 'I represent an SVG document'>

  | children |

  Svg class >> new [
    <category: 'instance creation'>
    ^super new init.
  ]

  init [
    <category: 'initialization'>
    children := OrderedCollection new.
  ]

  children: aCollection [
    children := aCollection.
  ]

  asSvgString [
    ^ '<svg>',
    (children inject: '' into: [:result :child | result, child asSvgString]),
    '</svg>'.
  ]

  printOn: stream [
    <category: 'printing'>
    stream nextPutAll: self asSvgString.
  ]
]


Object subclass: CssRule [
  <category: 'Graphics'>
  <comment: 'I represent a rule of a Cascading Style Sheet'>

  | selector declarations |

  CssRule class >> new  [
    <category: 'instance creation'>

    | cssRule |
    cssRule := super new.
    cssRule init.
    ^cssRule
  ]

  init [
    <category: 'initialization'>

    selector := ''.
    declarations := OrderedCollection new.
  ]

  selector: aSelector [
    selector := aSelector.
  ]

  declarations: aCollection [
    declarations := aCollection.
  ]

  asString [
    ^ selector asString, ' {', Character nl asString,
    (declarations
      inject: ''
      into: [:result :decl |
        result, decl asString, ';', Character nl asString]),
    '}'.
  ]

  printOn: stream [
    <category: 'printing'>

    stream nextPutAll: self asString.
  ]
]


Object subclass: Css [
  <category: 'Graphics'>
  <comment: 'I represent a Cascading Style Sheet'>

  | rules |

  Css class >> new [
    <category: 'instance creation'>
    | css |
    css := super new.
    css init.
    ^css
  ]

  init [
    <category: 'initialization'>
    rules := OrderedCollection new.
  ]

  rules: aCollection [
    rules := aCollection.
  ]

  printOn: stream [
    <category: 'printing'>

    (rules inject: ''
      into: [:result :rule | result, rule asString, Character nl asString])
    printNl.
  ]
]


Rectangle subclass: SvgRect [
  <category: 'Graphics'>
  <comment: 'I represent an SVG rectangle'>

  SvgRect class >> new [
    <category: 'instance creation'>
    ^super new init.
  ]

  asSvgString [
    ^'<rect ',
    'x="', self topLeft x asString, '" ',
    'y="', self topLeft y asString, '" ',
    'width="', self width asString, '" ',
    'height="', self height asString, '" ',
    '/>'.
  ]
]
