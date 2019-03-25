FileStream fileIn: './source/CssRule.st'.

Object subclass: Css [
  "I represent a Cascading Style Sheet"
  <category: 'Graphics'>

  | rules |

  initialize [
    "Answer an empty Css instance"
    <category: 'initialization'>
    rules := OrderedCollection new.
  ]

  rules: aCollection [
    "Set the CSS rules"
    <category: 'accessing'>
    rules := aCollection.
  ]

  isEmpty [
    "Check if Css instance does not contain any rules"
    <category: 'accessing'>
    ^rules isEmpty.
  ]

  asString [
    "Answer CSS string representation"
    <category: 'accessing'>
    ^rules
      inject: ''
      into: [:result :rule |
        result, rule asString, Character nl asString]
  ]

  printOn: aStream [
    "Print the string representation of the receiver on aStream"
    <category: 'printing'>
    aStream nextPutAll: self asString.
  ]
]
