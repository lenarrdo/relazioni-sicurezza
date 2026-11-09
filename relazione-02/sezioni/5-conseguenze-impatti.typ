// = Conseguenze e impatti

// Autore assegnato: Andrei Daniel Stefan
// TODO: Esempi di impatto di falso accettato, falso rifiuto e perdita/rubata del telefono.
// TODO: Impatto su privacy in caso di acquisizione o centralizzazione dei template biometrici.
// TODO: Valutazione qualitativa della probabilità, dell'impatto e delle condizioni di attacco.

// Inserire le citazioni nel testo usando @chiave-bibliografica.


= Rischi derivanti dalla compromissione dell'autenticazione biometrica

La compromissione di un sistema di autenticazione biometrica può produrre conseguenze significative, poiché consente a un *soggetto non autorizzato* di impersonificare l'utente legittimo. Nel caso di Face ID, un eventuale aggiramento del riconoscimento facciale potrebbe permettere l'accesso al dispositivo e, di conseguenza, alle informazioni e ai servizi protetti attraverso di esso.

Dal punto di vista del Cyber Risk Management, gli asset potenzialmente esposti comprendono i dati personali conservati sul dispositivo, le comunicazioni, le credenziali di accesso ai servizi e le applicazioni che utilizzano Face ID per autorizzare operazioni. La compromissione dell'autenticazione può quindi avere effetti sulla *riservatezza*, consentendo la consultazione di informazioni private, e sull'*integrità*, qualora l'attaccante riesca a modificare dati o eseguire operazioni a nome della vittima. In presenza di applicazioni finanziarie, potrebbero inoltre verificarsi conseguenze economiche.

È importante distinguere tra la compromissione del meccanismo biometrico e la compromissione dell'intero dispositivo. Un attacco riuscito contro Face ID non implica necessariamente che tutte le protezioni del sistema operativo siano state superate. L'impatto effettivo dipende dai privilegi ottenuti, dalle risorse accessibili e dagli ulteriori controlli richiesti dalle singole applicazioni.

Il caso Bkav evidenzia inoltre come il rischio debba essere valutato considerando non soltanto la probabilità tecnica di un attacco, ma anche le risorse necessarie e il valore dell'obiettivo. Un attacco basato su una maschera tridimensionale richiede una quantità significativa di informazioni sul volto della vittima e capacità tecniche specifiche. Di conseguenza, può risultare poco conveniente contro utenti comuni, ma più interessante nei confronti di persone che possiedono informazioni o risorse di elevato valore. WIRED e Ars Technica sottolinearono proprio la natura mirata dell'esperimento e le incertezze relative alla sua riproducibilità @wired-2017, @ars-2017.

Un ulteriore elemento di rischio deriva dalla natura dei dati biometrici. A differenza di una password, il volto di una persona non può essere facilmente sostituito dopo una compromissione. La possibilità di raccogliere immagini e scansioni facciali può quindi aumentare l'esposizione dell'identità dell'individuo, soprattutto nei sistemi di verifica remota. ENISA evidenzia come gli attacchi di presentazione biometrica rappresentino una minaccia concreta per i processi di verifica dell'identità digitale @enisa-2022.

Il caso deve tuttavia essere interpretato criticamente: una singola dimostrazione sperimentale non è sufficiente per concludere che Face ID sia generalmente insicuro. Essa mostra piuttosto che anche sistemi biometrici avanzati devono essere valutati rispetto a scenari di attacco specifici e che la sicurezza dipende dalla combinazione di sensori, algoritmi, procedure di inizializzazione e controlli aggiuntivi.

Il rischio associato all'autenticazione biometrica non può essere eliminato completamente, ma deve essere gestito considerando il contesto di utilizzo, il valore degli asset protetti e le capacità degli attaccanti. L'adozione di meccanismi complementari, come un codice di accesso robusto, e la limitazione delle operazioni consentite dopo la sola verifica biometrica possono contribuire a ridurre l'impatto di un eventuale aggiramento del sistema.