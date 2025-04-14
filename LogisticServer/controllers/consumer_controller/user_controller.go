package consumercontroller

import (
	"encoding/json"
	"net/http"

	
	"logisticserver.com/models/consumer"
)

func CreateUserHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invalid Request", http.StatusMethodNotAllowed)
		return
	}

	var user consumer.User
	if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
		http.Error(w, "Invalid request body", http.StatusBadRequest)
		return
	}
	id, err := consumer.CreateUser(&user)
	if err != nil {
		http.Error(w, "Error Creating user", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(map[string]interface{}{"message": "User created Successfully", "id": int(id)})
	

}

func Signin(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "Invalid Method", http.StatusMethodNotAllowed)
		return
	}

	var user consumer.User
	if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
		http.Error(w, "Invalid request body", http.StatusBadRequest)
		return
	}
	id, message, err := consumer.SignInUser(&user)
	if err != nil {
		http.Error(w, message, http.StatusConflict)
		return
	}

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(map[string]interface{}{"message": message, "id": int(id)})

}
