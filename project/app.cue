package main

import "github.com/yoktobit/yoktocue/gen"

#CustomRouterGenerator: gen.#RouterGenerator & {
    Name: =~"^Möbelhaus"
}

Generator: #CustomRouterGenerator & {
    @gen(router)
    Name: "MöbelhausGenerator"
    Routes: {
        "/echo": {
            Name: "Echo"
            Method: "get"
        }
    }
}