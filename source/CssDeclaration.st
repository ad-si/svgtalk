Object subclass: CssDeclaration [
  <category: 'Graphics'>
  <comment: 'I represent a declaration of a Cascading Style Sheet rule'>

  | key value |

  CssDeclaration class >> key: keyString value: valueString  [
    <category: 'instance creation'>
    ^super new
      key: keyString;
      value: valueString;
      yourself.
  ]

  initalize [
    <category: 'initialization'>
    key := ''.
    value := ''.
  ]

  key: aString [ key := aString. ]
  value: aString [ value := aString. ]
  isEmpty [ ^key = '' & value = ''. ]

  asString [ ^key, ': ', value, ';'. ]
]
