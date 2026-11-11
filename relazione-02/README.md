# Relazione 2 — Face ID e autenticazione biometrica

**Consegna:** 10 novembre 2026, ore 23:59, in PDF. **Lettura richiesta:** circa 15 minuti, escluse bibliografia e allegato GenAI.

**Titolo:** _Face ID e autenticazione biometrica: sicurezza, spoofing e privacy_

## Divisione in cinque

| Autore               | Sezioni                               | Parole obiettivo (approssimative) | Responsabilità                                                      |
| -------------------- | ------------------------------------- | --------------------------------: | ------------------------------------------------------------------- |
| Davide Giordano      | 1 Introduzione                        |                           250–300 | Apertura; coordinamento `refs.yaml`, verifica uniformità e consegna |
| Amedeo Marino        | 2 Descrizione; 7 Conclusioni          |                 420–500 + 180–220 | Scenario, asset, claim, lifecycle; valutazione finale               |
| Andrea Zanzarella    | 3 Analisi tecnica                     |                           550–650 | TrueDepth, Secure Enclave, PAD, metriche, attacchi                  |
| Andrei Daniel Stefan | 4 Casi reali; 5 Conseguenze e impatti |                 350–450 + 250–300 | Bkav e limiti, rischi/impatti                                       |
| Leonardo Miani       | 6 Mitigazioni e comportamenti         |                           500–600 | Contromisure motivate, privacy, usabilità, GDPR                     |

**Totale indicativo:** 2.500–3.000 parole, da validare con una prova di lettura attenta.

## Fonti principali (chiavi della bibliografia)

- Davide: `@apple-faceid-2024`, `@nist-sp800-63b-2025`, `@edpb-2024`
- Amedeo: `@apple-faceid-2024`, `@apple-platform-security`, `@nist-sp800-63b-2025`
- Andrea: `@apple-platform-security`, `@apple-faceid-2024`, `@iso-30107-3-2023`, `@enisa-2022`, `@nist-sp800-63b-2025`
- Andrei: `@bkav-2017`, `@wired-2017`, `@ars-2017`, `@apple-faceid-2024`, `@enisa-2022`
- Leonardo: `@apple-faceid-privacy`, `@apple-faceid-2024`, `@nist-sp800-63b-2025`, `@edpb-2024`, `@fido-passkeys`

## Punti di attenzione

1. **Non generalizzare** le dichiarazioni su Face ID ad altri metodi di face unlock (specie 2D).
2. Distinguere **verifica/autenticazione 1:1** da **identificazione 1:N** e sorveglianza.
3. Il caso Bkav è una **dimostrazione dichiarata**, discussa criticamente da WIRED e Ars Technica, non una prova di aggiramento universale su ogni dispositivo o versione.
4. **NIST** descrive requisiti e buone pratiche in specifici scenari di digital identity, non è una certificazione della tecnologia Apple.
5. Distinguere il **template biometrico**, mantenuto localmente, dall'**esito booleano** concesso alle app. L'archiviazione locale riduce alcune minacce ma non elimina ogni rischio.
6. Per ogni misura, specificare **a quale attacco o vulnerabilità** risponde; evitare liste generiche.
7. **Cite e verifica** ogni affermazione fattuale, grafico o immagine. Evitare di attribuire a Deepfake remoti attacchi diretti a Face ID senza evidenze.
8. Segnalare i prompt effettivamente utilizzati nell’allegato GenAI, come richiesto dalla consegna.

## Uso del progetto

- Il progetto precedente `relazione-01/` resta intatto.
- Scrivete dentro `relazione-02/sezioni/`; ogni capitolo contiene TODO come **commenti Typst**.
- Aggiungere fonti nuove nel solo `relazione-02/refs.yaml` e citare con `@chiave`, es. `@apple-faceid-2024`.
- Template, logo, autori e componente LLM riusati dal primo lavoro.
- File principale: `relazione-02/26-FaceID-Relazione2.typ`.
- L’allegato GenAI non è stato inventato: va compilato dagli autori sulla base dell'uso effettivo.
- Se si usa la CLI Typst, compilare dalla cartella `relazione-02` con `typst compile 26-FaceID-Relazione2.typ`.
