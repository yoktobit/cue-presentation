package main

import "github.com/yoktobit/yoktocue/schema"

Model: schema.#Datamodel & {
    Name: "DemoModel"
    Models: {
        Person: {
            Fields: {
                Titel: {
					Label: "Titel"
					Type:  "string"
				}
				Vorname: {
					Label: "Vornamen"
					Type:  "string"
				}
				Nachname: {
					Label: "Nachname"
					Type:  "string"
				}
            }
        }
    } 
}

CreatePersonInput: Model.Models.Person
CreatePersonOutput: schema.#Model & {
	Name: "CreatePersonOutput"
    Fields: {
		Id: {
			Label: "ID"
			Type: "int64"
		}
		Model.Models.Person.Fields
	}
}