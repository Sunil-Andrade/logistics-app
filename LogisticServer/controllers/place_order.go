package controllers

import (
	"encoding/json"
	"net/http"

	"logisticserver.com/models"
)

func PlaceOrder(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invaid Method", http.StatusMethodNotAllowed)
		return
	}

	var order models.Order

	if err := json.NewDecoder(r.Body).Decode(&order); err != nil {
		http.Error(w, "Invaid Body", http.StatusBadRequest)
		return
	}

	err := models.PlaceOrder(&order)
	if err != nil {
		http.Error(w, "Error logging order", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{"message": "Order logged"})
}

func GetOrder(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invaid Method", http.StatusMethodNotAllowed)
		return
	}

	var user models.User
	err := json.NewDecoder(r.Body).Decode(&user)
	if err != nil {
		http.Error(w, "Invaid Body", http.StatusBadRequest)
		return
	}

	orders, err := models.GetOrder(&user)
	if err != nil {
		http.Error(w, "Error logging order", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]interface{}{"orders": orders})
}
