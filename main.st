Object subclass: Svg [
  <category: 'Graphics'>
  <comment: '
    I represent an SVG document.
    This is pretty awesome!
  '>

  | body |

  Svg class >> new [
    <category: 'instance creation'>
    | svg |
    svg := super new.
    svg init.
    ^svg
  ]

  init [
    <category: 'initialization'>
    body := 'test'.
  ]

  printOn: stream [
    stream nextPutAll: '<svg>'.
    body printOn: stream.
    stream nextPutAll: '</svg>'.
  ]
]
