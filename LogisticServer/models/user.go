package models

import (
	"log"

	"logisticserver.com/config"
)

type User struct {
	ID       int    `json:"id,omitempty"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
	Address  string `json:"address"`
	Comp_ID  int    `json:"comp_id"`
}

func CreateUser(user *User) (int64, error) {
	query := "INSERT INTO USER (NAME,USER_EMAIL,PASSWORD,ADDRESS,COMP_ID) VALUES (?,?,?,?,?)"
	result, err := config.DB.Exec(query, user.Name, user.Email, user.Password, user.Address, 1)
	if err != nil {
		log.Println("Error creating user: ", err)
		return 0, err
	}
	userId, err := result.LastInsertId()
	if err != nil {
		return 0, err
	}
	return userId, nil
}

func SignInUser(user *User) (int64, string, error) {
	query := "SELECT PASSWORD FROM USER WHERE USER_EMAIL = ?"

	var pass string
	var id int64
	err := config.DB.QueryRow(query, user.Email).Scan(&pass, &id)
	if err != nil {
		log.Println("Error logging in: ", err)
		return 0, "Failed to sign in", err
	}
	if pass != user.Password {
		return 0, "Incorrect Password or Email", err
	}
	return id, "Successfull", nil
}
