package app

import "github.com/hofstadter-io/hof/schema/gen"
import "github.com/yoktobit/yoktocue/schema"
import "strings"

#Generator: gen.#Generator & {
	Name:   =~"^Demo"
}

#RouterGenerator: #Generator & {
	Routes: #Routes
}

#Routes: [path= =~"^/demo/"]: schema.#Route & {
    Path: path
    ...
}

RouterGenerator: #RouterGenerator & {
	@gen(router)
    Name: "DemoRouterGenerator"
    MyRoutes=Routes: DemoRoutes
    Out: [{
		In: {
			Routes: MyRoutes
		}
		TemplatePath: "router/router_types.go"
		Filepath:     "router/router_types.go"
	},
    {
		In: {
			Routes: MyRoutes
		}
		TemplatePath: "router/router.go"
		Filepath:     "router/router.go"
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
        Filepath:     "router/handle_\(_lowerName).go"
    },
    ]
    PackageName: ""
}

PersistenceGenerator: #Generator & {
    @gen(persistence)
    Name: "DemoPersistenceGenerator"
    Out: [
        {
            In: {
                Models: DemoModel.Models
            }
            TemplatePath: "persistence/persistence_model.go"
            Filepath: "persistence/persistence_model.go"
        },
        {
            In: {
                Models: DemoModel.Models
            }
            TemplatePath: "persistence/persistence_service.go"
            Filepath: "persistence/persistence_service.go"
        }
    ]
    PackageName: ""
}