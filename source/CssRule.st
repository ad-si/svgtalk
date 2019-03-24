Object subclass: CssRule [
  <category: 'Graphics'>
  <comment: 'I represent a rule of a Cascading Style Sheet'>

  | selector declarations |

  initalize [
    <category: 'initialization'>

    selector := ''.
    declarations := OrderedCollection new.
  ]

  selector: aSelector [ selector := aSelector. ]
  declarations: aCollection [ declarations := aCollection. ]

  asString [
    ^selector asString, ' {', Character nl asString,
    (declarations
      inject: ''
      into: [:result :decl | result, decl asString]),
    '}'.
  ]

  printOn: stream [
    <category: 'printing'>

    stream nextPutAll: self asString.
  ]
]
