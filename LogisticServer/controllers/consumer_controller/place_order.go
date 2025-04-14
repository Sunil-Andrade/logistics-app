package consumercontroller

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"

	"logisticserver.com/models/consumer"
)

func PlaceOrder(w http.ResponseWriter, r *http.Request) {
	print("resquest it")
	if r.Method != http.MethodPost {
		http.Error(w, "Invaid Method", http.StatusMethodNotAllowed)
		return
	}

	var order consumer.Order

	if err := json.NewDecoder(r.Body).Decode(&order); err != nil {
		http.Error(w, "Invaid Body", http.StatusBadRequest)
		return
	}

	err := consumer.PlaceOrder(&order)
	if err != nil {
		http.Error(w, "Error logging order", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{"message": "Order logged"})
}

func GetOrder(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Invaid Method", http.StatusMethodNotAllowed)
		return
	}

	userID := r.URL.Query().Get("userID")

	// var user consumer.User
	// err := json.NewDecoder(r.Body).Decode(&user)
	// if err != nil {
	// 	http.Error(w, "Invaid Body", http.StatusBadRequest)
	// 	return
	// }
	id, err := strconv.Atoi(userID)
	fmt.Println("\nuserID raw string:", userID)
	fmt.Println("Parsed userID:", id)

	
	if err != nil {
		http.Error(w, "Mistaaaake", http.StatusInternalServerError)
		return
	}

	orders, err := consumer.GetOrder(id)
	if err != nil {
		http.Error(w, "Error logging order", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]interface{}{"orders": orders})
}

func AssignShip(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invaid Method", http.StatusMethodNotAllowed)
		return
	}

	var order consumer.Order
	err := json.NewDecoder(r.Body).Decode(&order)
	if err != nil {
		http.Error(w, "Invaid Body", http.StatusBadRequest)
		return
	}

}
