= Descrizione del tema e contesto di rischio <sec:descrizione-contesto>

// Autore assegnato: Amedeo Marino
// TODO: Identità/claim da verificare, attori, contesto e asset (telefono, dati, pagamenti, template).
// TODO: Caratteristiche della biometria: riconoscimento probabilistico, enrollment, recupero e reset.
// TODO: Cosa fa Face ID, differenza rispetto ad altri face unlock 2D; come funziona a grandi linee.
// TODO: Ciclo di vita e modello di rischio: minaccia, vulnerabilità, impatto.

// Inserire le citazioni nel testo usando @chiave-bibliografica.

La tecnologia Face ID viene usata come fattore di autenticazione per diversi utilizzi: sblocco dello smartphone, conferma di pagamenti e accesso ai propri account online. Il suo obiettivo è verificare l'identità dell'utente che sta utilizzando il dispositivo in quel momento. A questa identità sono infatti associati dati personali riservati, tra cui applicazioni e file presenti sul dispositivo e dati bancari @apple-faceid-2024. Questi asset possono essere estremamente sensibili, specialmente se presenti su un dispositivo che portiamo con noi tutti i giorni. Per la varietà di questi dati, numerosi attori hanno interesse nel poter bypassare o ingannare questo metodo di autenticazione.

Una tradizionale scansione facciale 2D si appoggia a semplici dati ottici, come un'immagine. Un sistema di questo tipo sarebbe facilmente bypassabile, semplicemente usando foto della persona proprietaria dello smartphone. Face ID basa il suo funzionamento sul sistema "TrueDepth", che mappa il volto tramite onde infrarosse. Durante il setup vengono fatti diversi scan da diversi angoli, per creare un modello completo del viso. Ogni volta che esso viene scansionato, il sistema viene continuamente ricalibrato per poter adattarsi ai piccoli cambiamenti che il nostro corpo attraversa del corso degli anni.

Il match è probabilistico: c'è un certo margine di errore ammesso. Questo svela la prima possibile debolezza del sistema: queste discrepanze potrebbero diventare vettore di attacco, come nel caso Bkav @bkav-2017, dove una maschera 3D è riuscita ad ingannare Face ID. Nonostante ciò, viene promosso come un'alternativa superiore rispetto all'autenticazione basata su impronta digitale: Apple dichiara un errore di 1 su 1 milione contro 1 su 50 mila. Test di terze parti faticano a verificare questi dati @businessinsider-faceid-twins @mashable-faceid-twins, poichè si tratta di un sistema chiuso e difficilmente testabile. La stessa Apple ammette percentuali di successo minori quando si parla di gemelli oppure individui più piccoli dei 13 anni.
