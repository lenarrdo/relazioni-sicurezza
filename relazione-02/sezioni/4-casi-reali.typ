// = Casi reali ed esempi noti

// Autore assegnato: Andrei Daniel Stefan
// TODO: Caso Bkav 2017: dimostrazione dichiarata di sblocco iPhone X con maschera 3D.
// TODO: Limiti della prova: analisi giornalistiche critiche, generalizzabilità e replicazione.
// TODO: Caso quotidiano documentato Apple: gemelli/somiglianze familiari, età inferiore ai 13 anni.
// TODO: Distingui Face ID da riconoscimento facciale remoto e da generici smartphone.

// Inserire le citazioni nel testo usando @chiave-bibliografica.


= Il tentativo di aggiramento di Face ID tramite maschera 3D 

Un caso significativo per comprendere i limiti dell'autenticazione biometrica è rappresentato dall'attacco presentato nel novembre 2017 dalla società vietnamita Bkav contro Face ID. L'obiettivo dell'attacco era dimostrare che il sistema potesse essere ingannato utilizzando una maschera artificiale, anziché il volto reale dell'utente.

La tecnologia che Face ID utilizza, descritta nella sezione precedente, è progettata per distinguere un volto reale da immagini o riproduzioni artificiali, rendendo più complesso un tentativo di impersonificazione @apple-faceid-2024.

Nel proprio esperimento, Bkav dichiarò di aver realizzato una maschera utilizzando una combinazione di stampa 3D, immagini bidimensionali e materiali modellati artigianalmente. Secondo i ricercatori, il costo dei materiali era di circa 150 dollari e la maschera era in grado di sbloccare un iPhone X. L'attacco richiedeva tuttavia informazioni dettagliate sul volto della persona da impersonare, ottenute mediante una scansione tridimensionale del volto della persona e scatti fotografici da diverse angolazioni @bkav-2017, @wired-2017.

La dimostrazione suscitò un dibattito sulla robustezza del sistema. WIRED evidenziò che l'attacco poteva essere rilevante soprattutto per obiettivi di alto valore, ma risultava poco pratico nei confronti dell'utente medio, a causa del tempo, delle risorse e delle informazioni necessarie per realizzare la maschera @wired-2017.

Anche Ars Technica sottolineò la difficoltà di valutare pienamente il risultato. In particolare, non era chiaro se il dispositivo fosse stato sbloccato immediatamente dopo la registrazione del volto reale oppure se il sistema avesse avuto modo di adattarsi alla maschera nel tempo. L'assenza di dettagli metodologici e di verifiche indipendenti impediva quindi di considerare la dimostrazione una prova definitiva di una vulnerabilità generalizzata di Face ID @ars-2017.

Il caso costituisce un esempio di *presentation attack*, nel quale l'attaccante presenta al sistema un artefatto biometrico costruito per essere riconosciuto come la persona legittima. Questa tipologia di attacco è tuttora rilevante anche nei sistemi di verifica dell'identità da remoto, come evidenziato da ENISA, che analizza attacchi tramite fotografie, video, maschere tridimensionali e deepfake @enisa-2022.
