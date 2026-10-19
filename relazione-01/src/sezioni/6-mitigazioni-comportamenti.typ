= Mitigazioni e Comportamenti Corretti

Le principali azioni compiute da Shai-Hulud possono essere riassunte in due punti principali:

1. *Esfiltrazione di credenziali*: il worm aggiunge al file `package.json` del pacchetto `npm` infettato due nuovi script per inizializzare ed eseguire il runtime JavaScript "Bun", potendo eseguire il payload bypassando i controlli di `node.js`. La credenziali vengono cercate sia nel filesystem locale che in cloud, e poi pubblicate in una repository pubblica su GitHub.
2. *Replicazione automatica*: se il worm individua un token `npm` valido salvato in locale (ad esempio nel file `.npmrc`), interroga l'API di `npm` per identificare fino a 100 pacchetti mantenuti dall'utente. Dopodiché scarica tali pacchetti, inietta i propri script di `preinstall` nel `package.json`, incrementa la versione patch e ripubblica automaticamente i pacchetti infetti tramite `npm publish` @datadog-2025.

Una prima contromisura da adottare per prevenire l'attivazione del worm è aggiungere il flag `--ignore-scripts` in fase di installazione delle dipendenze (con `npm install`): in questo modo, lo script `preinstall` non verrà eseguito @snyk-2025. Sempre in ambito dipendenze, è opportuno cancellare la cache `npm` e modificare il `package.json` fissando le dipendenze a una versione nota rilasciata in data precedente all'attacco @wiz-2025.

Per prevenire l'ulteriore propagazione del worm ed evitare la compromissione dei propri account, ciascun utente dovrebbe abilitare servizi di autenticazione a più fattori, idealmente tramite _chiavi di sicurezza hardware_ (es., YubiKey). In questo modo, quando il malware tenta di completare la chiamata API per il `npm publish`, la piattaforma rifiuta la richiesta per mancanza della firma crittografica forte o dell'OTP hardware valido, bloccando sul nascere la catena di infezione della supply chain @npm-2026.
