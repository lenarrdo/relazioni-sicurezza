#import "/templates/llm.typ": *

#llm(
  "Andrei Daniel Stefan s356980",
  ("casi reali",),
  "Claude Sonnet 5.5 Medium",
)[
  Il primo prompt è stato il seguente:
  #prompt(
    "Chi era il paziente 0 dell'attacco shai hulud npm nel settembre 2025? come è riuscito a entrare nel pc della vittima e a iniziare a diffondersi dato che è un worm autoreplicante?",
  )

  Il modello ha risposto con delle informazioni molto generiche. Il successivo prompt è stato inviato allegando il documento `2026_DidatticaAttiva Relazione1.pdf`
  #prompt(
    "Devo scrivere una relazione riguardante questo attacco seguendo le istruzioni seguenti. in particolare devo scrivere la parte dei casi reali ed esempi noti:",
  )

  Il suo output è stato, anche qui, molto generico, non riuscendo a comprendere che io dovessi concentrarmi solo sulla sezione dei casi reali e, inoltre, dandomi delle fonti che, controllando, non mi sono sembrate molto affidabili (probabilmente per la loro poca fama online).

  Successivi prompt hanno aiutato a raffinare la ricerca e a concentrarsi sull'argomento richiesto, offrendo delle fonti con una notorietà maggiore.

  Esempi di prompt successivi simili:
  #prompt(
    "ma io voglio solo il paragrafo dei casi reali...non tutta l'analisi dell'attacco che verrà fatta da qualcun altro, non da me

[risposta]

riscrivi. la descrizione di cosa sia shai hulud gia sarà in un paragrafo descrittivo a parte.... devo parlare di casi reali dell'attacco shai hulud!

[risposta]",
  )

  L'output finale è stato letto, modificato e le fonti sono state controllate per verificarne l'autenticità e la veridicità dei fatti riportati.
]

