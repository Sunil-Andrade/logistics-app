package main

import (
	// "fmt"

	"fmt"
	"log"
	"net/http"

	"logisticserver.com/config"
	"logisticserver.com/routes"
	// "logisticserver.com/models"
)

func main() {
	config.ConnectDB()

	mux := http.NewServeMux()

	fmt.Print("Server is running on port 8080")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Welcome to the server"))
	})
	routes.CargoRoutes(mux)
	routes.UserRoutes(mux)
	routes.ShipRoute(mux)

	if err := http.ListenAndServe("0.0.0.0:8080", mux); err != nil {
		log.Fatal("Server Error: ", err)
	}
}
