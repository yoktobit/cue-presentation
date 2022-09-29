package router

import "github.com/labstack/echo/v4"

func SetupRouter(e *echo.Echo) {

	e.POST("/demo/person/create", handleCreatePerson)

}
