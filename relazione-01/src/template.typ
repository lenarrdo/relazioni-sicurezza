#let template(
  title: none,
  subtitle: none,
  authors: (),
  university-logo: none,
  course: none,
  team-name: none,
  body,
) = {
  set page(
    paper: "a4",
    margin: 3cm,
    header: context {
      if counter(page).get().first() > 1 {
        text(fill: gray)[
          #title
          #h(1fr)
          #counter(page).display()
        ]
      }
    },
    footer: context {
      if counter(page).get().first() > 1 {
        text(align(left, course), fill: gray)
      }
    },
  )
  set text(font: "Fira Sans", lang: "it")
  show raw: set text(font: "Fira Mono")

  grid(
    columns: (75%, auto),
    [
      #box([
        #strong(text(2em, title))
        #linebreak()
        #text([Gruppo #team-name], fill: gray)

        #for author in (
          authors
        ) [ #author.matricola - #author.name \ ]
        #if authors != () {
          v(0.5em)
        }
      ])
    ],
    [
      #if university-logo != none {
        align(
          bottom,
          image(university-logo),
        )
      }
    ],
  )

  set par(justify: true)
  set heading(numbering: "1.a")
  show figure: align.with(center)

  body

  bibliography("refs.bib")
}
