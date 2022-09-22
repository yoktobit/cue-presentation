package persistence
type CreatePerson interface {
	CreatePerson(PersonRecord) (PersonRecord, error)
}

type PersonRepository interface {
	CreatePerson
}

type personRepository struct{}

func (personRepository) CreatePerson(person PersonRecord) (PersonRecord, error) {

	person.Id = 100
	return person, nil
}

func NewPersonRepository() (PersonRepository, error) {

	personRepository := personRepository{}
	return personRepository, nil
}

