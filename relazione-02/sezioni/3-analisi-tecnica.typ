= Analisi tecnica e superfici di attacco <sec:superfici-attacco>

// Autore assegnato: Andrea Zanzarella
// TODO: TrueDepth: profondità/IR, modello matematico; Secure Enclave e confine hardware-software.
// TODO: Matching 1:1 e concetti FMR/FNMR; attenzione e PAD/liveness.
// TODO: Presentation attacks: fotografia, video, maschera 3D (non tutti funzionano contro Face ID).
// TODO: Rischi di enrollment, sensori e attacchi di injection (distinti dallo spoofing fisico).

// Inserire le citazioni nel testo usando @chiave-bibliografica.

== Acquisizione e confine hardware-software

La fotocamera #emph[TrueDepth] proietta e analizza migliaia di punti infrarossi invisibili per costruire una mappa di profondità del volto e acquisisce anche un'immagine a infrarossi @apple-faceid-2024. La sequenza delle acquisizioni 2D e di profondità è randomizzata, il pattern proiettato è casuale e specifico del dispositivo, e i dati sono firmati digitalmente prima di essere inviati al #emph[Secure Enclave] @apple-platform-security. Qui una parte del Secure Neural Engine li converte in una "rappresentazione matematica" e la confronta con quella registrata in fase di enrollment @apple-platform-security; i dati Face ID registrati sono cifrati con una chiave disponibile solo al #emph[Secure Enclave] @apple-faceid-2024. Apple non pubblica il modello (architettura, dimensione del template): ne conosciamo il ruolo, non i dettagli. Il confine di fiducia passa quindi tra sensore e #emph[Secure Enclave], che sblocca il dispositivo oppure segnala che il match è valido, ad esempio per Apple Pay e per le app @apple-platform-security.

== Matching 1:1 e metriche di errore

Face ID esegue una verifica 1:1: confronta il volto presentato con il template del proprietario, senza cercarlo in un archivio (identificazione 1:N). L'esito dipende da una soglia che regola un compromesso: renderla più severa riduce il *FMR* (False Match Rate, impostori accettati) ma aumenta il *FNMR* (False Non-Match Rate, utenti legittimi rifiutati). Per la biometria, nei suoi requisiti per i sistemi di identità digitale (non una certificazione di Face ID), NIST richiede un FMR di uno su 10.000 o migliore, mantenuto anche sotto attacco conforme, con soglia fissa e un FNMR inferiore al 5% come valore raccomandato @nist-sp800-63b-2025. Apple dichiara una probabilità di falso match inferiore a uno su 1.000.000 per una persona a caso con una sola configurazione del volto registrata, più alta per gemelli, fratelli somiglianti e minori di 13 anni, e richiede il passcode dopo cinque tentativi falliti @apple-faceid-2024. Sono però valori dichiarati dal produttore: non risultano test indipendenti né un FNMR pubblicato, e il valore descrive un impostore casuale, non uno somigliante.

== Attacchi di presentazione <sec:attacchi-presentazione>

ENISA distingue gli strumenti di attacco in digitali (schermi che riproducono contenuti) e fisici (ad esempio maschere in silicone o stampate) @enisa-2022. Gli esempi riguardano però il riconoscimento remoto e non si trasferiscono automaticamente a Face ID, che usa profondità e infrarossi (nostra lettura).

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: left,
    table.header[*Attacco*][*Tipo*][*Contromisura o limite in Face ID*],
    [Foto o stampa],
    [Fisico, 2D],
    [Manca l'informazione di profondità richiesta @apple-faceid-2024],

    [Video su schermo],
    [Digitale],
    [Superficie piatta: stesso principio (inferenza nostra)],

    [Maschera 3D],
    [Fisico],
    [Contrastata da reti anti-spoofing @apple-faceid-2024; il caso più documentato nelle nostre fonti è Bkav (sezione 4) @bkav-2017],
  ),
  caption: [Attacchi di presentazione e loro rilevanza per Face ID],
)

== Enrollment, sensori e injection

L'enrollment cattura il volto in più pose e il template si aggiorna con l'uso, anche dopo un match ravvicinato seguito dal passcode @apple-platform-security @apple-faceid-2024. Ciò aiuta l'usabilità, ma in teoria un aggiornamento potrebbe far slittare progressivamente il template (nessuna evidenza pubblica). Il passcode resta il fallback e la radice di fiducia: è richiesto dopo riavvio, dopo 48 ore senza sblocco o dopo cinque match falliti @apple-faceid-2024, e NIST impone sempre un'alternativa non biometrica @nist-sp800-63b-2025. Di conseguenza, l'attacco meno costoso potrebbe puntare al passcode e non al volto (valutazione nostra).

#figure(
  layout(size => {
    set par(justify: false)
    set text(hyphenate: false)
    let gap = 4pt
    let aw = 14pt
    let cw = (size.width - 2 * aw - 4 * gap) / 3
    let b(t, fill: luma(245)) = block(
      width: 100%,
      inset: 6pt,
      radius: 3pt,
      stroke: 0.6pt + luma(90),
      fill: fill,
      text(size: 9pt, t),
    )
    let n(t) = block(width: 100%, inset: (x: 2pt, y: 3pt), text(
      size: 8.5pt,
      fill: luma(60),
      t,
    ))
    grid(
      columns: (cw, aw, cw, aw, cw),
      column-gutter: gap,
      row-gutter: 4pt,
      align: center + horizon,
      b[Volto presentato],
      [→],
      b[Sensore #emph[TrueDepth]: punti IR e immagine IR],
      [→],
      b(
        fill: luma(225),
      )[#emph[Secure Enclave]: confronto con il template, esito],
      grid.cell(
        colspan: 2,
        n[*Presentazione*: foto, video o maschera davanti al sensore],
      ),
      grid.cell(
        colspan: 2,
        n[*Injection*: contenuto inserito nel flusso tra sensore e confronto],
      ),
      [],
    )
  }),
  caption: [Punto di azione di presentazione e injection nella catena di acquisizione. Elaborazione nostra da @apple-platform-security e @enisa-2022],
)

L'*injection* è distinta dalla presentazione: per ENISA il contenuto è inserito direttamente nel flusso del dispositivo di acquisizione, aggirando la fotocamera, e non è un attacco di presentazione. Nel riconoscimento remoto è ritenuto, dagli operatori del settore, il metodo più promettente per gli attaccanti, ma manca un quadro di test condiviso @enisa-2022. Per Face ID, la firma dei dati dal sensore al #emph[Secure Enclave] è coerente con una difesa contro questa classe (nostra lettura, Apple non la presenta così).
