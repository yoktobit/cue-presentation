package app

import "github.com/yoktobit/yoktocue/schema"

DemoRoutes: schema.#Routes & {
    "/demo/person/create": {
        Name:   "CreatePerson"
        Method: "post"
        Input:  CreatePersonInput
        Output: CreatePersonOutput
    }
}

CreatePersonRoute: [ for x in DemoRoutes if x.Name == "CreatePerson" {x}][0]