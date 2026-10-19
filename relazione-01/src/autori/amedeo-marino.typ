= Amedeo Marino S358012

Autore delle sezioni:

- introduzione;
- descrizione;
- conclusione.

== Modello utilizzato

Claude Sonnet 5.5 High

== Modalità di utilizzo

I paragrafi in questione sono stati innanzitutto scritti senza aiuti esterni, eccetto l'utilizzo delle fonti dichiarate in bibliografia. Il modello LLM è stato utilizzato per verificare l'aderenza a tutti i requisiti stabiliti nelle istruzioni.

Il modello ha avuto come contesto i seguenti file:

- `2026_DidatticaAttiva Relazione1`;
- `relazione esempio_1`;
- `relazione esempio_2`;
- `relazione esempio_3`.

Il prompt principale, come inizio del dialogo, è stato il seguente:

#block(
  width: 100%,
  inset: 1em,
  fill: luma(245),
  radius: 4pt,
)[
```text
Sto scrivendo la prima relazione del corso di sicurezza dei sistemi informativi. Mi occupo in particolare della parte di introduzione e descrizione non tecnica del worm Shai Hulud. Potresti controllare e suggerire eventuali miglioramenti in base alla consegna data dal professore e alle relazioni di esempio? 

[ paragrafi nella loro forma originale ]

Esplora anche queste pagine web che ho usato come fonti, controllando che tutti i dati riportati siano coerenti:
https://www.darkreading.com/application-security/shai-hulud-hackers-teampcp-lucky-skilled
https://krebsonsecurity.com/2025/09/18-popular-code-packages-hacked-rigged-to-steal-crypto/
https://krebsonsecurity.com/2025/09/self-replicating-worm-hits-180-software-packages/
https://www.stepsecurity.io/blog/ctrl-tinycolor-and-40-npm-packages-compromised
https://socket.dev/blog/ongoing-supply-chain-attack-targets-crowdstrike-npm-packages
```
]

Il modello ha fatto notare come il testo fosse poco adatto a un lettore non tecnico. Inoltre, c'erano alcune discrepanze tra le dichiarazioni fatte dall'autore e quelle delle fonti effettive, e l'aderenza non era completa al modello del Cyber Risk Management.

Le modifiche risultanti hanno portato a una pesante riscrittura dell'insieme, aggiungendo definizioni e precisazioni per un pubblico non tecnico. Anche il discorso è stato rimodellato, portando più informazioni dall'introduzione alla descrizione e descrivendo gli avvenimenti in un ordine meno confusionario.
