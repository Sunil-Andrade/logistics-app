package companycontroller

import (
	"encoding/json"
	"fmt"
	"net/http"

	company "logisticserver.com/models/comapny"
)

func GetPorts(w http.ResponseWriter, r *http.Request) {
	
	if r.Method != http.MethodGet {
		http.Error(w, "Invalid Method", http.StatusMethodNotAllowed)
		return
	}

	list, err := company.GetPorts()
	if err != nil {
		http.Error(w, fmt.Sprintf("Failed to fetch ports: %v", err), http.StatusInternalServerError)
		return
	}

	// Set JSON content type
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

	// Encode response
	if err := json.NewEncoder(w).Encode(map[string]interface{}{"ports": list}); err != nil {
		http.Error(w, fmt.Sprintf("Failed to encode response: %v", err), http.StatusInternalServerError)
	}
}
