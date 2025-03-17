package controllers

import (
	"encoding/json"
	"net/http"

	"logisticserver.com/models"
)

func EmpCompSignIn(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invalid method", http.StatusMethodNotAllowed)
		return
	}

	var empcmp models.CompEmp

	if err := json.NewDecoder(r.Body).Decode(&empcmp); err != nil {
		http.Error(w, "Invalid req body ", http.StatusBadRequest)
		return
	}

	if r.URL.Path == "/employee/login" {
		empcmp.Who = 1
	} else if r.URL.Path == "/company/login" {
		empcmp.Who = 2
	}

	message, err := models.SigninEmpCmp(&empcmp)
	if err != nil {
		http.Error(w, message, http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]string{"message": message})

}

func GetEmployees(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "Invalid method", http.StatusMethodNotAllowed)
		return
	}

	list, err := models.GetEmployees()
	if err != nil {
		http.Error(w, "Invalid metfod", http.StatusMethodNotAllowed)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]interface{}{"employees": list})
}
