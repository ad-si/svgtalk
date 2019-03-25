Object subclass: Svg [
  "I represent an SVG document"
  <category: 'Graphics'>

  | children style |

  initialize [
    ""
    <category: 'initialization'>
    children := OrderedCollection new.
    style := Css new.
  ]

  children: aCollection [
    ""
    <category: 'accessing'>
    children := aCollection.
  ]

  style: aCss [
    ""
    <category: 'accessing'>
    style := aCss.
  ]

  asString [
    ""
    <category: 'accessing'>

    ^'<svg xmlns="http://www.w3.org/2000/svg">',
    (style isEmpty
      ifTrue: ['']
      ifFalse: ['<style>', style asString, '</style>']),
    (children
      inject: ''
      into: [:result :child | result, child asString]),
    '</svg>'.
  ]

  printOn: stream [
    ""
    <category: 'printing'>
    stream nextPutAll: self asString.
  ]
]
