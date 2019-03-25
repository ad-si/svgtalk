Object subclass: CssRule [
  "I represent a rule of a Cascading Style Sheet"
  <category: 'Graphics'>

  | selector declarations |

  initialize [
    ""
    <category: 'initialization'>
    selector := ''.
    declarations := OrderedCollection new.
  ]

  selector: aSelector [
    ""
    <category: 'accessing'>
    selector := aSelector.
  ]

  declarations: aCollection [
    ""
    <category: 'accessing'>
    declarations := aCollection.
  ]

  asString [
    "Answer CSS string representation of receiver"
    <category: 'accessing'>
    ^selector asString, ' {', Character nl asString,
    (declarations
      inject: ''
      into: [:result :decl | result, decl asString]),
    '}'.
  ]

  printOn: aStream [
    "Print the string representation of the receiver on aStream"
    <category: 'printing'>
    aStream nextPutAll: self asString.
  ]
]
