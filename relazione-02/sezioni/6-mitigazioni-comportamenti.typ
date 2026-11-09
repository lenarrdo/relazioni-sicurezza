// Autore assegnato: Leonardo Miani
// TODO: Collegare una contromisura a ciascuna minaccia: PAD, sensori profondità, limite tentativi, codice robusto.
// TODO: Secure Enclave e memorizzazione locale; ripristino/eliminazione template e fallback.
// TODO: Impostazioni attenzione, sblocco in ambienti a rischio, aggiornamento e furto del dispositivo.
// TODO: Tradeoff sicurezza/usabilità/accessibilità; differenza Face ID locale vs archivi centrali.
// TODO: Collegamento sintetico al GDPR e principi di minimizzazione, proporzionalità.

= Mitigazioni e comportamenti corretti

== Presentation Attack Detection

In @sec:attacchi-presentazione sono stati introdotti i "Presentation Attack", in cui un attaccante presenta al sensore biometrico un artefatto contraffatto (Presentation Attack Instrument, PAI) per impersonare un utente legittimo. Nel caso di sistemi d'autenticazione elementari, una semplice fotografia bidimensionale potrebbe bastare a ingannare il meccanismo di riconoscimento biometrico @arxiv.

Per rispondere a questa vulnerabilità, la comunità scientifica e gli enti di standardizzazione (in particolare l'ISO/IEC tramite la famiglia di standard ISO/IEC 30107) hanno formalizzato un insieme di contromisure note come *Presentation Attack Detection* (*PAD*), ovvero un insieme di metodologie hardware e software concepite per determinare in modo automatico se il campione acquisito provenga da un soggetto vivo e presente al momento della scansione oppure da una riproduzione sintetica. L'ISO/IEC 30107-3 definisce cosa un sistema PAD debba fare e come misurarne l'efficacia @iso-30107-3-2023.

La scelta delle specifiche tecniche da adottare è comunque in mano ai produttori, in base al bilanciamento usabilità/sicurezza desiderato. Nel caso di Face ID, la PAD viene realizzata attraverso i seguenti meccanismi @apple-faceid-2024:
#list(
  [_Sensore TrueDepth_ (approfondito più nel dettaglio in @sec:descrizione-contesto), per bloccare immediatamente PAI privi di profondità, come le fotografie.],
  [_Reti neurali anti-spoofing_, per contrastare tentativi di contraffazione tridimensionale più complessi (come le maschere 3D).],
  [_Rilevamento dell'attenzione_: Face ID verifica che gli occhi dell'utente siano aperti e che lo sguardo sia orientato verso lo schermo prima di autorizzare lo sblocco. Questo meccanismo impedisce tentativi di sblocco non autorizzati a insaputa dell'utente, ad esempio mentre sta dormendo.],
  [_Throttling e blocco dei tentativi_: contro tentativi ripetuti di presentazione o attacchi di forza bruta, il sistema consente un massimo di 5 tentativi falliti consecutivi, dopodiché disabilita la biometria e impone l'inserimento del passcode.],
)

== Configurazione consapevole

Trattandosi di un sistema chiuso con elaborazione biometrica isolata nella Secure Enclave, l'utente non ha modo di intervenire sui parametri interni di Face ID. La sicurezza biometrica non agisce però in isolamento, in quanto il sistema richiede obbligatoriamente un meccanismo di fallback basato su un passcode o una password alfanumerica @apple-faceid-2024. La resistenza complessiva del dispositivo rimane quindi direttamente vincolata alla robustezza di quest'ultima credenziale, rendendo fondamentale la scelta di un codice complesso. Sebbene il sistema applichi un blocco temporaneo progressivo dopo reiterati tentativi errati, occorre infatti evitare passcode banali (come `000000` o `123456`) o legati a informazioni personali facilmente reperibili.
