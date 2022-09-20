package main

import gen2 "github.com/hofstadter-io/hof/schema/gen"
import "github.com/yoktobit/yoktocue/schema"
import "strings"

#CustomRouterGenerator: gen2.#Generator & {
	Name:   =~"^Demo"
	Routes: #Routes
}

#Routes: [path= =~"^/demo/"]: schema.#Route & {
    Path: path
    ...
}

//Generator: #CustomRouterGenerator & {
//	@gen(router)
//	Name: "DemoGenerator"
//	Routes: {
//		MyRoutes
//	}
//    PackageName: "github.com/yoktobit/yoktocue"
//}

Generator2: #CustomRouterGenerator & {
	@gen(router2)
    Name: "DemoGenerator2"
    MyRoutes=Routes: {
	    "/demo/person": {
            Name:   "CreatePerson"
            Method: "post"
            Input:  CreatePersonInput
            Output: CreatePersonOutput
	    }
    }
    Out: [{
		In: {
			Routes: MyRoutes
		}
		TemplatePath: "router/router_types.go"
		Filepath:     "routercc/router_types.go"
	},
    {
		In: {
			Routes: MyRoutes
		}
		TemplatePath: "router/router.go"
		Filepath:     "routercc/router.go"
	},
    for _, R in MyRoutes {
        In: {
            Route: {
                R
                PackageName: "router"
            }
        }
        _lowerName: strings.ToLower(R.Name)
        TemplatePath: "router/handle_route.go"
        Filepath:     "routercc/handle_\(_lowerName).go"
    },
    ]
    PackageName: ""
}
