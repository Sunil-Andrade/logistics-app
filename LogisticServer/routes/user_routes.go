package routes

import (
	"net/http"

	"logisticserver.com/controllers"
)

func UserRoutes(mux *http.ServeMux) {
	mux.HandleFunc("/users/create", controllers.CreateUserHandler)
	mux.HandleFunc("/users/signin", controllers.Signin)
	mux.HandleFunc("/employee/login", controllers.EmpCompSignIn)
	mux.HandleFunc("/company/login", controllers.EmpCompSignIn)
	mux.HandleFunc("/employee/getemployee", controllers.GetEmployees)
}
