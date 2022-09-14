package main

import "github.com/yoktobit/yoktocue/gen"

#CustomRouterGenerator: gen.#RouterGenerator & {
    Name: =~"^Möbelhaus"
    Routes: #Routes
}

#Routes: [=~"^/echo/"]: _

Generator: #CustomRouterGenerator & {
    @gen(router)
    Name: "MöbelhausGenerator"
    Routes: {
        "/echo/:text": {
            Name: "Echo"
            Method: "get"
        }
    }
}