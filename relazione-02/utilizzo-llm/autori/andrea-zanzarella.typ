#import "/templates/llm.typ": *

#llm(
  "Andrea Zanzarella s361615",
  ("analisi tecnica",),
  "Claude Sonnet 5.5 Medium",
)[
  *Attività svolte con il supporto del modello*
  - Lettura delle fonti (pagine Apple su Face ID, NIST SP 800-63B-4, ENISA, ISO/IEC 30107-3).
  - Realizzazione in Typst del diagramma della catena di acquisizione.
  - Revisione: coerenza e ripetizioni con le altre sezioni, correzioni grammaticali, riformulazione in forma impersonale, stima del tempo di lettura.

  *Prompt più significativi*
  #prompt("scrivimi una bozza della sezione 3. Usa le fonti che ti ho fornito")
  #prompt("ci sono diagrammi che vale la pena inserire in questa sezione?")
  #prompt("controlla che il contenuto della sezione analisi tecnica sia coerente con le altre sezioni e che non ci siano ripetizioni, generami un riepilogo e non modificare niente")

  *Verifica delle fonti*
  Le affermazioni tecniche della sezione sono state confrontate con il testo delle fonti, lette dal modello durante la stesura: le pagine Apple su Face ID e sulla sicurezza della piattaforma (probabilità di falso match, cinque tentativi falliti, passcode dopo 48 ore, Secure Enclave, controllo dell'attenzione), il documento NIST SP 800-63B-4 (FMR di uno su 10.000, FNMR inferiore al 5%, alternativa non biometrica) e il rapporto ENISA (presentation attack e injection, strumenti digitali e fisici).

  *Modifiche introdotte dopo l'output*
   Le risposte sono state usate per correggere tutti gli errori grammaticali, la riformulazione di alcune frasi e l'introduzione del diagramma della catena di acquisizione.
]
