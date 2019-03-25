Object subclass: CssDeclaration [
  "I represent a declaration of a Cascading Style Sheet rule"
  <category: 'Graphics'>

  | key value |

  CssDeclaration class >> key: keyString value: valueString  [
    "Answer a CssDeclaration instance with given key-value pair"
    <category: 'instance creation'>
    ^super new
      key: keyString;
      value: valueString;
      yourself.
  ]

  initialize [
    "Set key and value to empty strings"
    <category: 'initialization'>
    key := ''.
    value := ''.
  ]

  key: aString [
    "Set key of CssDeclaration instance"
    <category: 'accessing'>
    key := aString.
  ]

  value: aString [
    "Set value of CssDeclaration instance"
    <category: 'accessing'>
    value := aString.
  ]

  isEmpty [
    "Check if the receiver is empty"
    <category: 'accessing'>
    ^key = '' & value = ''.
  ]

  asString [
    "Answer string representation of receiver"
    <category: 'accessing'>
    ^key, ': ', value, ';'.
  ]
]
