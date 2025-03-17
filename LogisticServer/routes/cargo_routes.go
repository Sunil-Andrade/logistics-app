package routes

import (
	"net/http"

	"logisticserver.com/controllers"
)

func CargoRoutes(mux *http.ServeMux) {
	mux.HandleFunc("/orders/placeorder", controllers.PlaceOrder)
	mux.HandleFunc("/orders/getorders", controllers.GetOrder)
	// mux.HandleFunc("/orders/assignship")
}
