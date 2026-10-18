= Analisi Tecnica

Le ricostruzioni indicano come punto di partenza una campagna di *phishing*: un’email mascherata da avviso di sicurezza di npm che spingeva gli sviluppatori ad “aggiornare” l’autenticazione a più fattori e inserire le credenziali su un sito controllato dall’attaccante. Con delle credenziali valide l’attaccante può pubblicare nuove versioni di pacchetti legittimi.

Il worm funziona in modo analogo a un virus: ogni vittima diventa a sua volta un infettore:

#figure(
  image("/figures/propagazione-shai-hulud.png"),
  caption: [Propagazione di Shai-Hulud.],
) <fig:propagazione-shai-hulud>

Nel dettaglio, si comporta così:

- *Esecuzione.* Il payload è un file javascript offuscato di circa 3,6 MB ([_bundle.js_](http://bundle.js)), lanciato dallo script *postinstall*. Il codice verifica di girare su Linux o macOS e salta i sistemi Windows.
- *Raccolta di segreti.* Il malware legge le variabili d’ambiente (compreso GITHUB_TOKEN), i token personali GitHub e i token npm; interroga i gestori di segreti di AWS e Google Cloud e i servizi di metadata delle istanze cloud; scarica ed esegue TruffleHog, un legittimo strumento open source di ricerca di segreti, sull’intero filesystem. L’uso di uno strumento lecito, presentato come una "scansione di sicurezza", e la gestione silenziosa degli errori riducono le tracce lasciate.
- *Esfiltrazione.* Con il token GitHub trovato crea un repository pubblico chiamato Shai-Hulud nell’account della vittima, con un file JSON contenente informazioni di sistema, variabili d’ambiente e segreti. In più, aggiunge un branch con un workflow GitHub Actions (shai-hulud-workflow.yml) che, a ogni push, invia il contenuto di secrets a un endpoint webhook.site controllato dall’attaccante.
- *Esposizione di repository privati.* Il worm enumera i repository accessibili alla vittima, anche privati, e li rende visibili pubblicamente: Aikido lo descrive come un cambio di visibilità, TrendAI come la copia in repository pubblici marcati "Shai-Hulud Migration".
- *Propagazione.* Se trova un token npm valido (in \~/.npmrc o nell’ambiente), lo verifica, elenca i pacchetti di cui l’utente è manutentore (fino a 20), incrementa la versione, aggiunge lo script postinstall e il file _bundle.js_ e ripubblica. In questo modo l’infezione "salta" da un manutentore al successivo senza intervento umano.
