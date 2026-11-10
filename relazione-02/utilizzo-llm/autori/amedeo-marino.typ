#import "../../templates/llm.typ": *

#llm(
  "Amedeo Marino s358012",
  ("descrizione", "conclusione"),
  "Claude Opus 5.5 Medium",
)[
  I paragrafi in questione sono stati innanzitutto scritti senza aiuti esterni, eccetto l'utilizzo delle fonti dichiarate in bibliografia. Il modello è stato usato unicamente come aiuto per individuare errori grammaticali o frasi poco scorrevoli

  Il prompt principale, come inizio del dialogo, è stato il seguente:
  #prompt(
    "Potresti controllare il capitolo 2-descrizione di questa seconda relazione? ci sono errori grammaticali o incoerenze?",
  )
  La risposta è stata usata per correggere tutti gli errori grammaticali e la riformulazione di alcune frasi. Il contenuto è rimasto invariato
]
