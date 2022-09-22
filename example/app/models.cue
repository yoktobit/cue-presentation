package app

import "github.com/yoktobit/yoktocue/schema"

DemoModel: schema.#Datamodel & {
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

CreatePersonInput: DemoModel.Models.Person
CreatePersonOutput: schema.#Model & {
	Name: "CreatePersonOutput"
    Fields: {
		Id: {
			Label: "ID"
			Type: "int64"
		}
		DemoModel.Models.Person.Fields
	}
}