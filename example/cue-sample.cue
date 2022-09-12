import "strings"
import "list"

#Datenmodell: {
    #Sportverein
}

#Sportverein: {
    Name: #Name
    Eingetragen: bool
    Koordinaten: [float, float]
    Mitglieder: [#Mitglied, #Mitglied, ...#Mitglied] & list.MinItems(2)
    MitgliederAnzahl: len(Mitglieder)
    _HatMinimalAnzahl: MitgliederAnzahl & >= 2
}

#Name: string
#Vorname: #Name
#Nachname: #Name

#Sportverein: {
    Eingetragen: _
    Name: =~ "Verein"
    _NameValidator: Eingetragen & strings.HasSuffix(Name, " e.V.")
}

#Mitglied: {
    Vorname: #Vorname
    Nachname: #Nachname
    Skills: [...#Fähigkeit]
    ...
}

#Fähigkeit: string
#Fähigkeit: "Springen" | "Laufen" | "Denken" | "Schlafen" | "Essen"


DerVerein: #Datenmodell & {
    Name: "DerVerein e.V."
    Eingetragen: true
    Koordinaten: [54.123, 11.123]
    Mitglieder: [
        Martin,
        Martin2
    ]
}

Martin: {
    Vorname: "Martin"
    Nachname: "Windolph"
    Skills: ["Schlafen"]
}

Martin2: {
    Vorname: "Martin 2"
    Nachname: "Windolph"
    Skills: ["Essen"]
}