= Analisi tecnica e superfici di attacco

// Autore assegnato: Andrea Zanzarella
// TODO: TrueDepth: profondità/IR, modello matematico; Secure Enclave e confine hardware-software.
// TODO: Matching 1:1 e concetti FMR/FNMR; attenzione e PAD/liveness.
// TODO: Presentation attacks: fotografia, video, maschera 3D (non tutti funzionano contro Face ID).
// TODO: Rischi di enrollment, sensori e attacchi di injection (distinti dallo spoofing fisico).

// Inserire le citazioni nel testo usando @chiave-bibliografica.

== Acquisizione e confine hardware-software

La camera #emph[TrueDepth] proietta e analizza migliaia di punti infrarossi invisibili per costruire una mappa di profondità del volto e acquisisce anche un'immagine a infrarossi @apple-faceid-2024. La sequenza delle acquisizioni 2D e di profondità è randomizzata, il pattern proiettato è casuale e specifico del dispositivo, e i dati sono firmati digitalmente prima di essere inviati al #emph[Secure Enclave] @apple-platform-security. Qui una parte del Secure Neural Engine li converte in una "rappresentazione matematica" e la confronta con quella registrata in fase di enrollment; i dati sono cifrati con una chiave disponibile solo al #emph[Secure Enclave] @apple-faceid-2024. Apple non pubblica il modello (architettura, dimensione del template): ne conosciamo il ruolo, non i dettagli. Il confine di fiducia passa quindi tra sensore e #emph[Secure Enclave]; al resto del sistema arriva solo l'esito, perché il #emph[Secure Enclave] sblocca il dispositivo o segnala che il match è valido, ad esempio per Apple Pay e per le app @apple-platform-security.

== Matching 1:1 e metriche di errore

Face ID esegue una verifica 1:1: confronta il volto presentato con il template del proprietario, senza cercarlo in un archivio (identificazione 1:N). L'esito dipende da una soglia che regola un compromesso: alzarla riduce il *FMR* (False Match Rate, impostori accettati) ma aumenta il *FNMR* (False Non-Match Rate, utenti legittimi rifiutati). Per la biometria NIST richiede un FMR di uno su 10.000 o migliore, mantenuto anche sotto attacco conforme, con soglia fissa e un FNMR inferiore al 5 % come valore raccomandato @nist-sp800-63b-2025. Apple dichiara una probabilità di falso match inferiore a uno su 1.000.000 per una persona a caso con un solo aspetto registrato, più alta per gemelli, fratelli somiglianti e minori di 13 anni, e richiede il passcode dopo cinque tentativi falliti @apple-faceid-2024. Sono però valori dichiarati dal produttore: non risultano test indipendenti né un FNMR pubblicato, e il valore descrive un impostore casuale, non uno somigliante.

== Liveness e Presentation Attack Detection

Il solo matching non distingue un volto vivo da una sua riproduzione: serve il *PAD*. ISO/IEC 30107-3 ne definisce metodi di test e di reporting, con metriche come APCER (attacchi classificati come legittimi) e BPCER (presentazioni legittime classificate come attacchi) @iso-30107-3-2023; NIST richiede il PAD per il riconoscimento facciale @nist-sp800-63b-2025. Face ID combina tre elementi: la profondità, assente in stampe e foto 2D; reti neurali anti-spoofing contro le maschere; e il controllo dell'attenzione, che verifica occhi aperti e sguardo rivolto al dispositivo @apple-faceid-2024 @apple-platform-security. Il controllo è disattivabile per accessibilità: un compromesso tra usabilità e sicurezza.

== Attacchi di presentazione

ENISA distingue gli strumenti di attacco in digitali (schermi che riproducono contenuti) e fisici (ad esempio maschere in silicone o stampate) @enisa-2022. Gli esempi riguardano però il riconoscimento remoto con fotocamere comuni e non si trasferiscono a Face ID, che usa profondità e infrarossi.

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: left,
    table.header[*Attacco*][*Tipo*][*Perché è (o non è) rilevante per Face ID*],
    [Foto o stampa], [Fisico, 2D], [Manca l'informazione di profondità richiesta @apple-faceid-2024],
    [Video su schermo], [Digitale], [Superficie piatta: stesso principio (inferenza nostra)],
    [Maschera 3D], [Fisico], [Contrastata da reti anti-spoofing @apple-faceid-2024; il caso più documentato nelle nostre fonti è Bkav],
  ),
  caption: [Attacchi di presentazione e loro rilevanza per Face ID],
)

== Enrollment, sensori e injection

L'enrollment cattura il volto in più pose e il template si aggiorna con l'uso, anche dopo un match ravvicinato seguito dal passcode @apple-platform-security @apple-faceid-2024. Ciò aiuta l'usabilità, ma in teoria un aggiornamento potrebbe far derivare il template (nessuna evidenza pubblica). Il passcode resta fallback e radice di fiducia: è richiesto dopo riavvio, dopo 48 ore senza sblocco o dopo cinque match falliti @apple-faceid-2024, e NIST impone sempre un'alternativa non biometrica @nist-sp800-63b-2025. L'attaccante più economico mira dunque al passcode, non al volto.

#figure(
  layout(size => {
    set par(justify: false)
    set text(hyphenate: false)
    let gap = 4pt
    let aw = 14pt
    let cw = (size.width - 2 * aw - 4 * gap) / 3
    let b(t, fill: luma(245)) = block(width: 100%, inset: 6pt, radius: 3pt, stroke: 0.6pt + luma(90), fill: fill, text(size: 9pt, t))
    let n(t) = block(width: 100%, inset: (x: 2pt, y: 3pt), text(size: 8.5pt, fill: luma(60), t))
    grid(
      columns: (cw, aw, cw, aw, cw),
      column-gutter: gap,
      row-gutter: 4pt,
      align: center + horizon,
      b[Volto presentato],
      [→],
      b[Sensore #emph[TrueDepth]: punti IR e immagine IR],
      [→],
      b(fill: luma(225))[#emph[Secure Enclave]: confronto con il template, esito],
      grid.cell(colspan: 2, n[*Presentazione*: foto, video o maschera davanti al sensore]),
      grid.cell(colspan: 2, n[*Injection*: contenuto inserito nel flusso verso il matcher]),
      [],
    )
  }),
  caption: [Punto di azione di presentazione e injection nella catena di acquisizione. Elaborazione nostra da @apple-platform-security e @enisa-2022],
)

L'*injection* è distinta dalla presentazione: per ENISA il contenuto è inserito direttamente nel flusso del dispositivo di acquisizione, aggirando la fotocamera, e non è un attacco di presentazione. Nel riconoscimento remoto è ritenuto il metodo più promettente, ma manca un quadro di test condiviso @enisa-2022. Per Face ID, la firma dei dati dal sensore al #emph[Secure Enclave] è coerente con una difesa contro questa classe (nostra lettura, Apple non la presenta così).
