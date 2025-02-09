* Neue Rezepte werden in content/rezepte ergänzt
* Zum Aktualisieren wie folgt vorgehen:
  * `cd C:\Users\Christian\Documents\Hugo\kochbuch`
  * `hugo server -D`erzeugt lokale Version und startet lokalen Server zum Ausprobieren (-D mit Drafts)
  * `hugo` erzeugt lokale Version in public/
  * Alles von `public/` nach `../kochbuch_ghpages` kopieren, wobei die Unterverzeichnisstruktur erhalten bleibt: `.\deploy.ps1`
  * git pushen
