package routes

import (
	"net/http"

	"logisticserver.com/controllers"
)

func ShipRoute(mux *http.ServeMux) {
	mux.HandleFunc("/ships/getships", controllers.GetShips)
}
