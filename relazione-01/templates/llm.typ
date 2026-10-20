#let llm(author, sections, model-type, body) = {
  [
    == #author

    Autore delle sezioni:

    #list(..sections)

    === Modello utilizzato

    #model-type

    === Modalità di utilizzo

    #body
  ]
}

#let prompt(body) = {
  block(
    width: 100%,
    inset: 1em,
    fill: luma(245),
    radius: 4pt,
    [#raw(body)],
  )
}
