#import "template.typ": *

#show: template.with(
  title: "Shai-Hulud: una minaccia nella supply chain JavaScript",
  course: "Sicurezza dei Sistemi Informativi",
  team-name: "WannaCry",
  university-logo: "/figures/polito-logo.svg",
  authors: (
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
  ),
)

#include "sezioni/1-introduzione.typ"
#include "sezioni/2-descrizione.typ"
#include "sezioni/3-analisi-tecnica.typ"
#include "sezioni/4-casi-reali.typ"
#include "sezioni/5-conseguenze-impatti.typ"
#include "sezioni/6-mitigazioni-comportamenti.typ"
#include "sezioni/7-conclusioni.typ"
