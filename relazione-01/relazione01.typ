#import "@preview/charged-ieee:0.1.4": ieee

#show: ieee.with(
  title: [Relazione 01 - Shai Hulud],
  abstract: none,
  authors: (
    (
      name: "Leonardo Miani",
      email: "leonardo.miani@studenti.polito.it",
    ),
    (
      name: "Davide Giordano",
      email: "nome.cognome@studenti.polito.it",
    ),
    (
      name: "Amedeo Marino",
      email: "nome.cognome@studenti.polito.it",
    ),
    (
      name: "Andrei Daniel Stefan",
      email: "nome.cognome@studenti.polito.it",
    ),
    (
      name: "Andrea Zanzarella",
      email: "nome.cognome@studenti.polito.it",
    ),
  ),
  bibliography: bibliography("refs.bib"),
  figure-supplement: [Fig.],
)

#include "sezioni/1-introduzione.typ"
#include "sezioni/2-descrizione.typ"
#include "sezioni/3-analisi-tecnica.typ"
#include "sezioni/4-casi-reali.typ"
#include "sezioni/5-conseguenze-impatti.typ"
#include "sezioni/6-mitigazioni-comportamenti.typ"
#include "sezioni/7-conclusioni.typ"
