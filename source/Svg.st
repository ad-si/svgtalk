Object subclass: Svg [
  <category: 'Graphics'>
  <comment: 'I represent an SVG document'>

  | children style |

  initialize [
    <category: 'initialization'>
    children := OrderedCollection new.
    style := Css new.
  ]

  children: aCollection [ children := aCollection. ]
  style: aCss [ style := aCss. ]

  asString [
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
    <category: 'printing'>
    stream nextPutAll: self asString.
  ]
]
