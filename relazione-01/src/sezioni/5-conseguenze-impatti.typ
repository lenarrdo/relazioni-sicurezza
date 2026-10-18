= Conseguenze e Impatti

L'attacco ha messo a nudo una fragilità strutturale: nella software supply-chain moderna basta davvero poco per scatenare
un effetto domino globale. Quando la sicurezza si basa sulla fiducia cieca nei pacchetti open source, un solo punto di cedimento
può compromettere centinaia di progetti nel giro di qualche ora.

Il primo e più immediato danno ha riguardato la fuga di dati riservati. La pubblicazione automatizzata di file JSON su
repository GitHub pubblici non è stata un semplice leak, ma un'esposizione sistematica di credenziali cloud (da AWS ad Azure),
token d'accesso e variabili d'ambiente. Diversi repository privati sono diventati visibili a tutti dall'oggi al domani,
mettendo sulla piazza codice proprietario e segreti aziendali.

Ma c'è di più. Con l'arrivo della versione 2.0, la minaccia è salita di livello colpendone il cuore operativo: le pipeline di CI/CD.
Trasformare le macchine dei dev o i server di build in runner self-hosted ha garantito agli attaccanti un canale d'accesso remoto
permanente. In sostanza, l'infrastruttura usata per distribuire software è diventata essa stessa il veicolo dell'infezione.

Gestire un incidente simile richiede costi imponenti. Per le aziende colpite la risposta non si è limitata a un riavvio: è
servito un lavoro enorme per revocare e ruotare centinaia di token, bonificare le macchine degli sviluppatori e analizzare a
fondo il codice alla ricerca di residui del payload. A questo si aggiunge un impatto reputazionale difficile da quantificare.
La compromissione di librerie popolarissime come ctrl/tinycolor o di pacchetti legati a nomi della cybersecurity come CrowdStrike
ha incrinato la fiducia nell'ecosistema npm, dimostrando quanto sia sottile il confine tra un componente sicuro e una porta d'ingresso per i malware.

