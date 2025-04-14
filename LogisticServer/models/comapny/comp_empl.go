package company

import (
	"logisticserver.com/config"
)

type CompEmp struct {
	Email    string `json:"email"`
	Password string `json:"password"`
	Who      int    `json:"who"`
}

type Employee struct {
	Name   string `json:"name"`
	Email  string `json:"email"`
	Emp_Id int    `json:"id"`
}

type User struct {
	UserID int    `json:"id"`
	Email  string `json:"email"`
	Name   string `json:"name"`
}

func SigninEmpCmp(cmpemp *CompEmp) (string, error) {
	var query string
	if cmpemp.Who == 1 {
		query = "SELECT PASS FROM EMPLOYEE WHERE EMAIL=?"
	}
	if cmpemp.Who == 2 {
		query = "SELECT PASSWORD FROM COMPANY WHERE EMAIL=?"
	}

	var pass string
	err := config.DB.QueryRow(query, cmpemp.Email).Scan(&pass)

	if err != nil {
		print(err)
		return "Problem Signing in", err
	}

	if cmpemp.Password != pass {
		return "Incorrect password or email", nil
	}
	return "Success", nil
}

func GetEmployees() ([]Employee, error) {
	query := "SELECT NAME,EMAIL,EMP_ID FROM EMPLOYEE"
	emps, err := config.DB.Query(query)
	var employees []Employee
	if err != nil {
		return nil, err
	}

	defer emps.Close()

	for emps.Next() {
		var emp Employee
		if err := emps.Scan(&emp.Name, &emp.Email, &emp.Emp_Id); err != nil {
			return nil, err
		}
		employees = append(employees, emp)
	}
	return employees, nil
}

func GetUsers() ([]User, error) {
	query := "SELECT USER_ID,NAME,USER_EMAIL FROM USER"
	userd, err := config.DB.Query(query)

	var users []User
	if err != nil {
		return nil, err
	}
	defer userd.Close()
	for userd.Next() {
		var user User
		if err := userd.Scan(&user.UserID, &user.Name, &user.Email); err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}
