package models

import "logisticserver.com/config"

type CompEmp struct {
	Email    string `json:"email"`
	Password string `json:"password"`
	Who      int    `json:"who"`
}

type Employee struct {
	Name   string `json:"name"`
	Emial  string `json:"email"`
	Emp_Id int    `json:"id"`
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
		if err := emps.Scan(&emp.Name, &emp.Emial, &emp.Emp_Id); err != nil {
			return nil, err
		}
		employees = append(employees, emp)
	}
	return employees, nil
}
