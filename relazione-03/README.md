# Relazione 3 — Messaggistica con cifratura end-to-end

**Consegna:** 1 dicembre 2026, ore 23:59, in PDF. **Lettura richiesta:** circa 15 minuti, escluse bibliografia e allegato GenAI.

**Titolo:** _Messaggistica con cifratura end-to-end (Signal, WhatsApp)_

## Divisione in cinque

| Autore               | Sezioni                                              | Parole obiettivo (approssimative) | Responsabilità                                                                          |
| -------------------- | ---------------------------------------------------- | --------------------------------: | --------------------------------------------------------------------------------------- |
| Andrei Daniel Stefan | 1 Introduzione; 7 Conclusioni e discussione          |                 250–300 + 180–220 | Apertura; coordinamento `refs.yaml`, verifica uniformità e consegna; valutazione finale |
| Andrea Zanzarella    | 2 Descrizione del tema e contesto di rischio         |                           420–500 | Scenario, asset, modello di minaccia, garanzie dichiarate                               |
| Amedeo Marino        | 3 Analisi tecnica e superfici di attacco             |                           550–650 | Protocollo, gestione chiavi, metadati, backup, superfici di attacco                     |
| Davide Giordano      | 4 Casi reali ed esempi noti; 5 Conseguenze e impatti |                 350–450 + 250–300 | Incidenti e vulnerabilità documentate; rischi e impatti                                 |
| Leonardo Miani       | 6 Mitigazioni e comportamenti corretti               |                           500–600 | Contromisure motivate, impostazioni, comportamenti degli utenti                         |

**Totale indicativo:** 2.500–3.000 parole, da validare con una prova di lettura attenta.

## Fonti principali (chiavi della bibliografia)

- Andrei: `@signal-docs`, `@whatsapp-whitepaper-2023`, `@edpb-2024`
- Andrea: `@whatsapp-whitepaper-2023`, `@whatsapp-faq-e2ee`, `@signal-docs`, `@cohn-gordon-2020`
- Amedeo: `@signal-x3dh-2016`, `@signal-doubleratchet`, `@whatsapp-whitepaper-2023`, `@cohn-gordon-2020`, `@signal-sealed-sender-2018`, `@whatsapp-backups-2021`
- Davide: `@nvd-cve-2019-3568`, `@checkpoint-whatsapp-2019`, `@rosler-2018`, `@whatsapp-backups-2021`
- Leonardo: `@signal-safety-number`, `@whatsapp-key-transparency-2023`, `@whatsapp-backups-2021`, `@whatsapp-faq-e2ee`, `@edpb-2024`

## Punti di attenzione

1. Per ogni misura, specificare **a quale attacco o vulnerabilità** risponde; evitare liste generiche.
2. **Cite e verifica** ogni affermazione fattuale, grafico o immagine.
3. Segnalare i prompt effettivamente utilizzati nell’allegato GenAI, come richiesto dalla consegna.

## Uso del progetto

- Scrivete dentro `relazione-03/sezioni/`; ogni capitolo contiene TODO come **commenti Typst**.
- Aggiungere fonti nuove nel solo `relazione-03/refs.yaml` e citare con `@chiave`.
- File principale: `relazione-03/WannaCry-Relazione3.typ`.
- L’allegato GenAI va compilato dagli autori sulla base dell'uso effettivo (`utilizzo-llm/`).
- Se si usa la CLI Typst, compilare dalla cartella `relazione-03` con `typst compile WannaCry-Relazione3.typ`.
