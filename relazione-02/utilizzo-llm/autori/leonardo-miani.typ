#import "/templates/llm.typ": *

#let gemini-notebook = [#link("https://notebook.google.com/")[Gemini Notebook]]

#llm(
  "Leonardo Miani s361817",
  ("Mitigazioni e comportamenti corretti",),
  "Gemini 3.6 Flash (Medium)",
)[
  Il workflow adottato è stato il seguente:
  #list(
    [
      Ho utilizzato #gemini-notebook per una prima esplorazione dei temi di riferimento, ponendo quesiti come:
      #prompt(
        "Potresti darmi una breve descrizione di cos'è un presentation attack?",
      )
    ],
    [
      A partire dai riferimenti alle fonti integrati nelle risposte di #gemini-notebook, ho consultato il materiale originale per approfondire i contenuti e redigere la prima bozza della sezione.
    ],
    [
      Ho successivamente sottoposto la bozza a Gemini per migliorarne la fluidità e rimuovere eventuali ridondanze, eseguendo infine una revisione del testo finale.
    ],
  )
]
