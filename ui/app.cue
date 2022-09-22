package main

import "github.com/hofstadter-io/hof/schema/gen"
import "github.com/yoktobit/cue-presentation/example/app"
import "github.com/yoktobit/yoktocue/schema"
import "strings"

AppFrontend: gen.#Generator & {
	@gen(frontend)
	Name: "DemoFrontendGenerator"
	let ParentFrontend=Frontend
	Frontend: schema.#Frontend & {
		AppTitle: "Demo"
		ModuleName: "Demo"
		FirstPage: "Willkommen"
		Pages: {
			Willkommen: {
				Steps: {
					Personendaten: {
						let M=app.DemoModel.Models.Person.Fields
						Fields: [
							M.Titel,
							M.Vorname,
							M.Nachname,
							StaticHtmlField
						]
					}
				}
			}
		}
	}
	Out: [{
		In: {
			Frontend: ParentFrontend
		}
		TemplatePath: "frontend/flutter/main.dart"
		Filepath:     "lib/main.dart"
	},

		for _, P in ParentFrontend.Pages {
			In: {
				Frontend: ParentFrontend
				Page: P
			}
			_lowerName:   strings.ToLower(P.Name)
			TemplatePath: "frontend/flutter/pages/page.dart"
			Filepath:     "lib/pages/\(_lowerName)/page_\(_lowerName).dart"
		},
		for _, P in ParentFrontend.Pages
		for _, S in P.Steps {
			In: {
				Frontend: ParentFrontend
				Page: P
				Step: S
			}
			_lowerPage:   strings.ToLower(P.Name)
			_lowerStep:   strings.ToLower(S.Name)
			TemplatePath: "frontend/flutter/pages/steps/step.dart"
			Filepath:     "lib/pages/\(_lowerPage)/steps/step_\(_lowerStep).dart"
		},

	]
	PackageName: ""
}

StaticHtmlField: schema.#HtmlField & schema.#SupportedFrontendField & {
	Name: "StaticHtmlField"
	Label: "StaticHtmlField"
	Content: """
		<h1>
		Überschrift
		</h1>
		<p>
		Ein Absatz dies ist.
		</p>
		"""
}