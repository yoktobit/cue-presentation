package router



type CreatePersonInput struct {
	
	Nachname string
	Titel string
	Vorname string
}

type CreatePersonOutput struct {
	
	Id int64
	Nachname string
	Titel string
	Vorname string
}


