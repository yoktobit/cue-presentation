package main

import (
	"github.com/labstack/echo/v4"
	"github.com/yoktobit/cue-project/router"
)

func main() {
	e := echo.New()
	router.SetupRouter(e)
	e.Start(":8080")
}
