#let authors = (
  (
    name: "Amedeo Marino",
    matricola: "s358012",
  ),
  (
    name: "Andrea Zanzarella",
    matricola: "s361615",
  ),
  (
    name: "Andrei Daniel Stefan",
    matricola: "s356980",
  ),
  (
    name: "Davide Giordano",
    matricola: "s361797",
  ),
  (
    name: "Leonardo Miani",
    matricola: "s361817",
  ),
);

#let relazione(
  title: none,
  subtitle: none,
  authors: authors,
  university-logo: "polito-logo.svg",
  course: "Sicurezza dei Sistemi Informativi",
  team-name: "WannaCry",
  llm-usage: "/utilizzo-llm/utilizzo-llm.typ",
  bib-file: "/refs.yaml",
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
  show raw: set text(font: "Fira Mono", size: 10pt)

  grid(
    columns: (75%, auto),
    [
      #box([
        #strong(text(2em, title))
        #linebreak()
        #text([Gruppo #team-name], fill: gray)

        #for author in (
          authors
        ) [ #text(font: "Fira Mono", size: 10.5pt, author.matricola) - #author.name \ ]
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

  outline(indent: auto)
  pagebreak()

  set par(justify: true)
  set heading(numbering: "1.")
  show figure: align.with(center)

  body

  pagebreak()
  bibliography(bib-file)

  if llm-usage != none {
    pagebreak()
    include llm-usage
  }
}
