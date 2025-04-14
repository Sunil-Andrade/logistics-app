package companycontroller

import (
	"encoding/json"
	"net/http"

	company "logisticserver.com/models/comapny"
)

func CGetOrder(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Invaid Method", http.StatusMethodNotAllowed)
		return
	}

	orders, err := company.CGetOrder()
	if err != nil {
		http.Error(w, "Error loading orders", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]interface{}{"orders": orders})
}
