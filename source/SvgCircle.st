FileStream fileIn: './source/CssDeclaration.st'.

Object subclass: SvgCircle [
  <category: 'Graphics'>
  <comment: 'I represent an SVG circle'>

  | center radius style |

  initialize [
    <category: 'initialization'>
    center := 0@0.
    radius := 1.
    style := OrderedCollection new.
  ]

  center: aPoint [ center := aPoint. ]
  radius: aNumber [ radius := aNumber. ]
  style: aCollection [ style := aCollection. ]

  asString [
    ^'<circle ',
      'cx="', center x asString, '" ',
      'cy="', center y asString, '" ',
      'r="', radius asString, '" ',
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
