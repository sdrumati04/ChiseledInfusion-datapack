# Chiseled Infusion — Datapack Edition

Port **solo datapack** (nessuna mod, nessuna resource pack) del mod Fabric
[`ChiseledInfusion`](https://github.com/sdrumati04/ChiseledInfusion), per
**Minecraft 26.3** (`pack_format` 121).

* Repo: https://github.com/sdrumati04/ChiseledInfusion-datapack
* Licenza: CC0-1.0 (vedi `LICENSE`)

## Installazione

1. Copia la cartella del pack in `<mondo>/datapacks/chiseled_infusion/`
   (deve contenere `pack.mcmeta` e `data/`).
2. In gioco: `/reload`
3. Solo la prima volta (o per ripristinare i default): `/function chiseledinfusion:config/defaults`

In alternativa scarica lo ZIP da **Releases** (o *Code → Download ZIP*) e
scompattalo: dentro c'è già `pack.mcmeta` + `data/`.

## Come si usa

| Azione | Risultato |
| --- | --- |
| Craft: ` C ` / `DOD` / `OOO` (C = tappeto rosso, D = diamante, O = ossidiana) | Ottieni il **Chiseled Infusion Table** (item `enchanting_table` con nome custom) |
| Piazza l'item | Diventa un tavolo di infusione (blocco `enchanting_table` + entità `interaction` che intercetta i click) |
| Click destro a mani vuote / con altro item | Ci metti 1 item dal main hand |
| Click destro con **lapis** in mano | Esegui l'infusione (libri incisi nelle vicinanze) |
| Click destro con qualsiasi altro item o a mani vuote (tavolo pieno) | Riprendi l'item |
| **Click sinistro** | Rompi il tavolo (l'item torna in gioco + il tavolo stesso cade) |
| Guarda il tavolo con un item sopra | Action bar con anteprima costo/esiti |

Il conteggio degli scaffali dipende da **chiseled bookshelf** nel raggio
5×5×2 intorno al tavolo (LOS come nel mod), il "potere libri" dal conteggio
5×5 (y −1..2) attorno al tavolo. L'infusione applica, per ogni enchant dei
libri, il **livello massimo** trovato; costa `3 livelli XP` per livello
guadagnato e `1 lapis` per enchant migliorato (tetto 30 livelli), e richiede
**ossidiana piangente sotto il tavolo** se il risultato supera il livello
massimo vanilla o contiene enchant incompatibili.

## Configurazione

Objective `ci.cfg` (scoreboard):

| Score | Default | Significato |
| --- | --- | --- |
| `#xh` | 2 | raggio orizzontale scansione scaffali (max 3) |
| `#xv` | 1 | raggio verticale sopra il tavolo (max 3) |
| `#xp` | 3 | livelli XP per livello di enchant guadagnato |
| `#lapis` | 1 | catalizzatore per enchant migliorato |
| `#maxxp` | 30 | tetto XP (0 = nessun tetto) |
| `#clear` | 1 | azzera il costo di riparazione anvil (0/1) |

Storage `ci:cfg` → `catalyst` (id item) e `catalyst_name` (componente JSON del
nome, usato nei messaggi). Per cambiare catalizzatore:

```
/data modify storage ci:cfg catalyst set value "minecraft:amethyst_shard"
/data modify storage ci:cfg catalyst_name set value '{"translate":"item.minecraft.amethyst_shard"}'
```

## Rigenerare le funzioni

Le parti ripetitive (42 enchant × libri, griglie di scansione, raggi) sono
generate:

```
python tools/generate.py
python tools/lint.py
```

## Test automatico (harness)

Il repo include un test end-to-end che verifica il comportamento reale, non
"sembra funzionare":

```
powershell -ExecutionPolicy Bypass -File tools\test.ps1
```

Cosa fa:

1. rigenera il pack e linta le funzioni;
2. prepara un mondo usa-e-getta in `%TEMP%\chiseled-infusion-test`;
3. scarica una volta il server vanilla **26.3** in `.cache/` (git-ignored: il
   jar non è nel repo);
4. installa il pack insieme al datapack spia `tools/harness/` e avvia il server;
5. esegue **le funzioni reali del pack** e controlla:

| Controllo | Atteso |
| --- | --- |
| `scan/run` con spada di diamante + libreria con Sharpness I | `#books = 1`, `#applicable = 1`, `#b.sharpness = 1` |
| `table/apply` | l'item ha `minecraft:enchantments."minecraft:sharpness" = 1` |

Esce `0` se entrambe le fasi riportano `CITEST ... PASS`, `1` altrimenti.
`-Keep` conserva mondo e log del server per il debug.

Requisiti: Java 25+ e Python 3 (per generate/lint).

## Verifica rapida in gioco

1. `/reload` → nessun errore in chat/log.
2. `/give @s minecraft:red_carpet 1` (o `/function chiseledinfusion:config/defaults`) e controlla che la ricetta del tavolo inciso appaia nel libro delle ricette.
3. Craftalo, piazzalo: dovrebbe comparire subito il tavolo "vivo" (blocco + interaction).
4. Metti un **libro** sopra (tasto destro a mani vuote con il libro in mano).
5. Costruisci 1 chiseled bookshelf a 2 blocchi, inserisci un libro incantato.
6. Guarda il tavolo → action bar con anteprima; click destro con **lapis** → infusione.
7. Click sinistro sul tavolo → cade il tavolo e l'item torna libero.

Se qualcosa non risponde: `/scoreboard players get #fail ci.tmp`, `#books`, `#applicable`,
`#upgrades`, `#cost`, `#cat`, `#shelf`, `#cry` dicono esattamente a che punto si è fermata la scansione.

## Differenze note rispetto al mod

* Il tavolo è un vero blocco `enchanting_table` (nessun modello custom): la
  shape è 16×16×16 invece di 16×12×16 e non ci sono le particelle ambientali.
* Non puoi piazzare un blocco **sopra** il tavolo (l'entità `interaction`
  cattura il click); nel mod si faceva con sneak.
* Il tavolo si rompe con un click sinistro immediato (il mod richiede il tempo
  di mining del blocco) e in creative non droppa nulla di diverso.
* I messaggi mostrano il livello in **cifre** (`Sharpness 5`) invece che in
  numeri romani; il nome del catalizzatore usa `catalyst_name`.
* La ricetta vanilla dell'enchanting table è disattivata (ricetta
  incraftable + advancement di sblocco neutralizzato): i tavoli vanilla già
  piazzati nel mondo restano usabili normalmente.
* La LOS laterale degli scaffali usa `#minecraft:enchantment_power_transmitter`
  (approssimazione di `isSolidRender`).
* Il catalizzatore viene contato in tutto l'inventario (non solo le 36 slot
  principali).
* Solo gli enchant **vanilla** (42) vengono letti dai libri.
