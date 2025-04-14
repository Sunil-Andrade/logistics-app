package routes

import (
	"net/http"

	
	consumercontroller "logisticserver.com/controllers/consumer_controller"
)

func UserRoutes(mux *http.ServeMux) {
	mux.HandleFunc("/users/create", consumercontroller.CreateUserHandler)
	mux.HandleFunc("/users/signin", consumercontroller.Signin)
	mux.HandleFunc("/orders/placeorder", consumercontroller.PlaceOrder)
	mux.HandleFunc("/orders/getorders", consumercontroller.GetOrder)
}
