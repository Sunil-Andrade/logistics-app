package config

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

var DB *sql.DB

func ConnectDB() {
	dsn := "root:mysql123@tcp(127.0.0.1:3306)/LOGISTICS"
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal("Database is not respnding", err)
	}

	err = db.Ping()
	if err != nil {
		log.Fatal("Database is not responding", err)
	}

	fmt.Println("Database connected Successfully")

	DB = db

}
