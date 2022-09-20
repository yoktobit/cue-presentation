package router

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/yoktobit/cue-project/persistence"
)

func handle{{.Route.Name}}(c echo.Context) error {

	{{camel .Route.Name}}Output := {{.Route.Name}}Output{}
	{{camel .Route.Name}}Input := {{.Route.Name}}Input{}
	if err := c.Bind(&{{camel .Route.Name}}Input); err != nil {
		c.Logger().Error(err)
		return err
	}
	personRepository, err := persistence.NewPersonRepository()
	if err != nil {
		c.Logger().Error(err)
		return err
	}
	person, err := personRepository.CreatePerson(persistence.PersonRecord{
		Titel:    createPersonInput.Titel,
		Vorname:  createPersonInput.Vorname,
		Nachname: createPersonInput.Nachname,
	})
	if err != nil {
		c.Logger().Error(err)
		return err
	}
	{{camel .Route.Name}}Output = {{.Route.Name}}Output{
		Id: person.Id,
	}
	{{camel .Route.Name}}Output.Titel = person.Titel
	{{camel .Route.Name}}Output.Vorname = person.Vorname
	{{camel .Route.Name}}Output.Nachname = person.Nachname
	return c.JSON(http.StatusCreated, {{camel .Route.Name}}Output)
}
