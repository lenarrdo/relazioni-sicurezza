= Descrizione Shai-Hulud

Non è ancora confermato come il primo pacchetto sia stato infettato: è possibile collegare la diffusione del worm ad una campagna di phishing avvenuta pochi giorni prima (8 settembre 2025), dove le e-mail dell'attaccante, impersonando npm, richiedevano di aggiornare dati relativi all'autenticazione a due fattori @krebs-phishing-2025. In questo modo gli attaccanti avrebbero avuto accesso ai profili di diversi sviluppatori, e la possibilità di diffondere le prime copie di Shai-Hulud.

Questo tipo di attacco è diretto contro la supply chain del software: non colpisce la vittima direttamente, ma un componente che si sceglie di usare di propria iniziativa, fidandosi quasi ciecamente. Quando uno sviluppatore installa un pacchetto infetto, il codice malevolo viene eseguito in fase di installazione, cercando sul computer credenziali per poterle rubare. Se Shai-Hulud trova anche un token npm, credenziali usate per pubblicare pacchetti a nome del proprietario, modifica i pacchetti della vittima ripubblicandoli infetti, accelerando la propria diffusione.

Le vittime di questo attacco sono tutti gli sviluppatori che utilizzano JavaScript, anche fuori da contesti professionali: il linguaggio è utilizzato ampiamente in ambienti accademici e hobbistici. Sono colpiti individui, aziende e sistemi di integrazione continua (CI), i server che compilano e pubblicano software in modo automatico. Shai-Hulud era progettato specificamente per Linux e macOS e non agiva su Windows @kurmi-2025 @krebs-worm-2025.

L'attacco non si basa su un'unica falla di sicurezza, ma su diverse debolezze del sistema. La prima è la fiducia implicita: un pacchetto scaricato da npm viene installato ed eseguito senza particolari controlli. Durante questi processi è possibile l'esecuzione di codice, cosa che il worm sfrutta per entrare in azione senza che lo sviluppatore se ne accorga @pandya-brown-2025. A ciò si aggiunge il fatto che token e chiavi sono spesso facilmente raggiungibili sul computer dello sviluppatore e rubate con facilità. Infine mancano controlli sulla provenienza dei pacchetti: il ricercatore di sicurezza Nicholas Weaver osserva che la pubblicazione può avvenire in modo automatico tramite le credenziali npm, senza il consenso esplicito di un umano @krebs-worm-2025.

Tra gli asset in gioco, figurano:

- credenziali: token GitHub e npm, chiavi di accesso a cloud AWS, Google Cloud e Azure, e altre informazioni riservate lasciate nelle “variabili d'ambiente”, dati memorizzati dal sistema operativo dove spesso si conservano credenziali @kurmi-2025;
- progetti GitHub: ulteriore strumento di raccolta di credenziali e segreti @kurmi-2025;
- reputazione di aziende e progetti: compagnie come Crowdstrike, colpita anch'essa da Shai Hulud, possono subire danni di immagine traducibili in perdite di denaro enormi.

Secondo alcune fonti, il probabile attore dietro Shai-Hulud è TeamPCP, un gruppo cybercriminale spinto da motivazioni finanziarie. La stessa organizzazione è ritenuta responsabile delle successive ondate Shai-Hulud, e, nel maggio 2026,ha pubblicato il codice sorgente del worm @culafi-2026.

La sua diffusione è stata bloccata nel giro di 3 giorni, grazie ad una serie di azioni: la pubblicazione online di elenchi dei pacchetti compromessi @kurmi-2025, la rimozione di questi dai registri npm @krebs-worm-2025 e il blocco del traffico verso l'indirizzo web verso cui Shai-Hulud inviava parte dei dati rubati. Da parte delle vittime, è stato necessario eliminare i pacchetti infetti installati localmente e sostituire tutte le chiavi di accesso @cisa-2025.
