package router

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/yoktobit/cue-project/persistence"
)

func handleCreatePerson(c echo.Context) error {

	createPersonOutput := CreatePersonOutput{}
	createPersonInput := CreatePersonInput{}
	if err := c.Bind(&createPersonInput); err != nil {
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
	createPersonOutput = CreatePersonOutput{
		Id: person.Id,
	}
	createPersonOutput.Titel = person.Titel
	createPersonOutput.Vorname = person.Vorname
	createPersonOutput.Nachname = person.Nachname
	return c.JSON(http.StatusCreated, createPersonOutput)
}

