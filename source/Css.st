FileStream fileIn: './source/CssRule.st'.

Object subclass: Css [
  <category: 'Graphics'>
  <comment: 'I represent a Cascading Style Sheet'>

  | rules |

  initialize [
    <category: 'initialization'>
    rules := OrderedCollection new.
  ]

  rules: aCollection [ rules := aCollection. ]
  isEmpty [ ^rules isEmpty. ]

  asString [
    ^rules
      inject: ''
      into: [:result :rule |
        result, rule asString, Character nl asString]
  ]

  printOn: stream [
    <category: 'printing'>
    stream nextPutAll: self asString.
  ]
]
