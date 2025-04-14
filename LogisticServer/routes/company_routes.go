package routes

import (
	"net/http"

	companycontroller "logisticserver.com/controllers/company_controller"
)

func CompanyRoutes(mux *http.ServeMux) {
	mux.HandleFunc("/company/login", companycontroller.EmpCompSignIn)
	mux.HandleFunc("/cmp/getports", companycontroller.GetPorts)
	mux.HandleFunc("/cmp/getorders", companycontroller.CGetOrder)
	mux.HandleFunc("/cmp/getemp", companycontroller.GetEmployees)
	mux.HandleFunc("/cmp/users", companycontroller.GetUsers)
}
