= Descrizione Shai-Hulud

Non è ancora confermato come il primo pacchetto sia stato infettato: è possibile collegare la diffusione del worm ad una campagna di phishing avvenuta pochi giorni prima (8 settembre 2025), dove le e-mail dell'attaccante, impersonando npm, richiedevano di aggiornare dati relativi all'autenticazione a due fattori @krebs-phishing-2025. In questo modo gli attaccanti avrebbero avuto accesso ai profili di diversi sviluppatori, e la possibilità di diffondere le prime copie di Shai-Hulud.

Questo tipo di attacco è diretto verso la supply-chain del software: non colpisce la vittima direttamente, ma un componente che utilizzerà di sua iniziativa, fidandosi in maniera quasi cieca. Quando uno sviluppatore installa un pacchetto infetto, il codice  malevolo viene eseguito in fase di installazione, cercando sul computer credenziali per poterle rubare. Se Shai-Hulud trova anche un token npm, credenziali usate per pubblicare pacchetti a nome del proprietario, modifica i pacchetti della vittima e li ripubblica infetti, accelerando la propria diffusione.

Le vittime di questo attacco sono tutti gli sviluppatori che utilizzano JavaScript, anche fuori da contesti professionali: il linguaggio è utilizzato ampiamente anche in ambienti accademici e hobbistici. Le conseguenze ricadono anche su aziende che usano questi pacchetti e i sistemi di integrazione continua (CI), i server che compilano e pubblicano software in modo automatico. Shai-Hulud era progettato specificamente per Linux e macOS e non agiva su Windows @kurmi-2025 @krebs-worm-2025.

L'attacco non si basa su un singolo difetto, ma su alcune debolezze del sistema. La prima è la fiducia implicita: un pacchetto scaricato da npm viene eseguito senza particolari controlli, e l'installazione può avviare codice in automatico, cosa che il worm sfrutta per entrare in azione senza che lo sviluppatore se ne accorga @pandya-brown-2025. A ciò si aggiunge il fatto che token e chiavi sono spesso facilmente raggiungibili sul computer dello sviluppatore e rubate con facilità. Infine mancano controlli sulla provenienza dei pacchetti: Weaver e il ricercatore Charlie Eriksen osservano che la pubblicazione può avvenire in modo automatico, senza il consenso esplicito di un umano @krebs-worm-2025.

Tra gli asset in gioco, figurano:

- credenziali: token GitHub e npm, chiavi di accesso a cloud AWS, Google Cloud e Azure, e altre informazioni riservate lasciate nelle “variabili d'ambiente”, le impostazioni del sistema dove spesso si conservano chiavi @kurmi-2025;
- i progetti GitHub: il malware vi inserisce un automatismo che invia all'esterno i segreti del repository a ogni modifica @kurmi-2025;
- reputazione di aziende e  progetti.

Anche se non confermato, il probabile attore dietro Shai-Hulud è TeamPCP, un gruppo cybercriminale spinto da motivazioni finanziarie @culafi-2026. La stessa organizzazione è ritenuta responsabile delle successive ondate Shai-Hulud, pubblicando, nel maggio 2026 il codice sorgente del worm.

La sua diffusione è stata bloccata nel giro di 3 giorni, grazie da una serie di azioni: la pubblicazione online di elenchi dei pacchetti compromessi @kurmi-2025, la rimozione di questi dai registri npm @krebs-worm-2025 e il blocco del traffico verso cui Shai-Hulud inviava parte dei dati rubati. Da parte delle vittime, è stato necessario eliminare i pacchetti infetti installati localmente e sostituire tutte le chiavi di accesso @cisa-2025.
