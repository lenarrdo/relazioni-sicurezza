= Analisi Tecnica

Le ricostruzioni indicano come vettore iniziale una campagna di *phishing*: un'e-mail mascherata da avviso di sicurezza di npm, che spingeva i manutentori ad "aggiornare" le proprie opzioni di autenticazione a più fattori e a inserire le credenziali su un sito controllato dall'attaccante @krebs-phishing-2025. Con credenziali valide, l'attaccante può pubblicare nuove versioni di pacchetti legittimi,

Il worm funziona in modo analogo a un virus e ogni vittima diventa a sua volta un infettore:

#figure(
  {
    let step(t) = box(width: 100%, inset: 6pt, radius: 3pt, stroke: 0.6pt + luma(90), fill: luma(245), align(center, text(size: 9.5pt, t)))
    let arrow = align(center, text(size: 11pt)[↓])
    layout(size => {
      let w = size.width - 22pt
      let body = box(width: w, stack(
        spacing: 3pt,
        step[*1.* Lo sviluppatore (o la pratica CI) esegue `npm install` di un pacchetto infetto],
        arrow,
        step[*2.* Lo script `postinstall`, aggiunto dall'attaccante, avvia il payload malevolo],
        arrow,
        step[*3.* Raccolta segreti: file di configurazione, variabili d'ambiente, TruffleHog],
        arrow,
        step[*4.* Esfiltrazione: repository pubblico "Shai-Hulud" e workflow GitHub Actions verso un endpoint dell'attaccante],
        arrow,
        step[*5.* Propagazione: con il token npm rubato si infettano altri pacchetti del manutentore e si pubblicano nuove versioni],
        arrow,
        step[*6.* Nuove vittime installano le versioni infette → si riparte dal punto 1],
      ))
      let h = measure(body).height
      // y del centro del primo e dell'ultimo blocco (blocchi su una riga)
      let y1 = 12pt
      let y2 = h - 12pt
      let s = 0.8pt + luma(90)
      // il corpo è centrato nel box: x0 è il bordo destro dei blocchi
      let x0 = (size.width - w) / 2 + w
      let x1 = x0 + 9pt
      box(width: size.width, height: h, {
        body
        place(top + left, dx: x0, dy: y2, line(length: 9pt, stroke: s))
        place(top + left, dx: x1, dy: y1, line(angle: 90deg, length: y2 - y1, stroke: s))
        place(top + left, dx: x0 + 5pt, dy: y1, line(length: 4pt, stroke: s))
        place(top + left, dx: x0, dy: y1 - 3pt, polygon(fill: luma(90), stroke: none, (0pt, 3pt), (5pt, 0pt), (5pt, 6pt)))
      })
    })
  },
  caption: [Ciclo di infezione e propagazione di Shai-Hulud],
) <fig:propagazione-shai-hulud>

Nel dettaglio, si comporta così:

- *Esecuzione.* Il payload è un file javascript offuscato di circa 3,6 MB (_bundle.js_), lanciato dallo script *postinstall*. Il codice verifica di girare su Linux o macOS e salta i sistemi Windows @kurmi-2025 @moore-2025.
- *Raccolta di segreti.* Il malware legge le variabili d'ambiente (compreso GITHUB_TOKEN), i token personali GitHub e i token npm; interroga i gestori di segreti di AWS e Google Cloud e i servizi di metadata delle istanze cloud; scarica ed esegue TruffleHog, un legittimo strumento open source di ricerca di segreti, sull'intero filesystem. L'uso di uno strumento lecito, presentato come una "scansione di sicurezza", e la gestione silenziosa degli errori riducono le tracce lasciate @kurmi-2025 @moore-2025.
- *Esfiltrazione.* Con il token GitHub trovato crea un repository pubblico chiamato Shai-Hulud nell'account della vittima, con un file JSON contenente informazioni di sistema, variabili d'ambiente e segreti. In più, aggiunge un branch con un workflow GitHub Actions (shai-hulud-workflow.yml) che, a ogni push, invia il contenuto di secrets a un endpoint webhook.site controllato dall'attaccante @kurmi-2025 @krebs-worm-2025.
- *Esposizione di repository privati.* Il worm enumera i repository accessibili alla vittima, anche privati, e li rende visibili pubblicamente: Aikido lo descrive come un cambio di visibilità, TrendAI come la copia in repository pubblici marcati "Shai-Hulud Migration" @aikido-2025 @trendai-2025.
- *Propagazione.* Se trova un token npm valido (in \~/.npmrc o nell'ambiente), lo verifica, elenca i pacchetti di cui l'utente è manutentore (fino a 20), incrementa la versione, aggiunge lo script postinstall e il file _bundle.js_ e ripubblica. In questo modo l'infezione "salta" da un manutentore al successivo senza intervento umano @kurmi-2025 @moore-2025.

*Debolezze sfruttate*

L'analisi mostra che nessuna singola vulnerabilità software è all'origine dell'attacco: il worm sfrutta *debolezze strutturali e di processo*:

+ *Esecuzione automatica di script di installazione*: il gestore di pacchetti esegue codice di terze parti senza consenso esplicito.
+ *Token a lunga durata*: i token npm e GitHub rubati restano validi finché nessuno li revoca, permettendo la propagazione @cisa-2025.
+ *Segreti in chiaro* nelle macchine di sviluppo (`.npmrc`, file `.env`, variabili d'ambiente), facilmente recuperabili da un processo qualsiasi dell'utente.
+ *Autenticazione debole dei manutentori*: l'MFA basata su codici temporanei (TOTP) può essere aggirata da un phishing ben fatto; GitHub ha annunciato il passaggio a metodi FIDO proprio per questo @github-2025.
+ *Fiducia transitiva nelle dipendenze* e aggiornamenti automatici (intervalli di versione come `^1.2.3`) che portano subito sul sistema le versioni appena pubblicate.
+ *Pipeline CI/CD con permessi eccessivi*, che concentrano segreti di alto valore.