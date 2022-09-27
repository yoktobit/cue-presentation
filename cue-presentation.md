---
marp: true
---

# Toolbox
## cuelang.org und hofstadter.io
### "High-Code" statt Low-Code

---
# Was ist Cue?

* Beschreibungssprache mit modularen Elementen
* Ergänzung/Erweiterung/Alternative zu JSON/YAML
* Definition und Daten in der gleichen Sprache
* kompatibel mit Protocol Buffers, Go Structs (Import der Definitionen)
* Go-API

---
# Noch eine neue Beschreibungssprache - Dein Ernst?

---
# ...JA

---
# USPs

* Fokus auf Wiederverwendung
* Erweiterte Validierungsmöglichkeiten
* Generator-Funktionen
* Variablen und mathematische Operatoren
* Selektoren
* Scripting/Tasks

---
# Anwendungsfälle

* im Projektumfeld skalierbarere Daten, z.B.
  * Docker/Kubernetes-Definitionen
  * CI/CD konfigurieren
  * Testfälle beschreiben
  * Configs aller Art
* Datenvalidierung
* z.B. im Zusammenhang mit hofstadter.io: Codegenerierung

---
# Nachteile

* _kein_ Standard
* zentralisierte Entwicklung
* Features > Performance

---
# Du stellst eine Sprache vor und zeigst Folien?
* \*Schnarch\*
* So?: {
* &nbsp;&nbsp;slide_num: int
* &nbsp;&nbsp;slide_num: >6
* &nbsp;&nbsp;slide_num: 7
* &nbsp;&nbsp;...
* }

---
# Schon gut!