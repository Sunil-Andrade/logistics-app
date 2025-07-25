package companycontroller

import (
	"encoding/json"
	"net/http"

	company "logisticserver.com/models/comapny"
)

func GetShips(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Invaid Method", http.StatusMethodNotAllowed)
		return
	}

	list, err := company.GetShips()
	if err != nil {
		http.Error(w, "Invalid metfod", http.StatusMethodNotAllowed)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]interface{}{"ships": list})

}
