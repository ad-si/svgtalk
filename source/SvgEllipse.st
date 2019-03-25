FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgEllipse [
  <category: 'Graphics'>
  <comment: 'I represent an SVG circle'>

  | center radiusX radiusY style |

  initialize [
    <category: 'initialization'>
    center := 0@0.
    radiusX := 1.
    radiusY := 2.
    style := OrderedCollection new.
  ]

  center: aPoint [ center := aPoint. ]
  radiusX: aNumber [ radiusX := aNumber. ]
  radiusY: aNumber [ radiusY := aNumber. ]
  style: aCollection [ style := aCollection. ]

  asString [
    ^'<ellipse ',
      'cx="', center x asString, '" ',
      'cy="', center y asString, '" ',
      'rx="', radiusX asString, '" ',
      'ry="', radiusY asString, '" ',
      ((style isEmpty)
        ifTrue: ['']
        ifFalse: [
          'style="',
          (style
            inject: ''
            into: [:result :rule | result, rule asString]),
          '" '
        ]),
      '/>'.
  ]
]
