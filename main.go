package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

var uri = "postgres://postgres:superstronkpassword@localhost:3306/postgres"

// "postgres://postgres:skapunk@34.163.64.88:5432/postgres"

func main() {

	db, err := sql.Open("postgres", uri)
	if err != nil {
		fmt.Print(err)
	}

	err = db.Ping()

	if err != nil {
		fmt.Print(err)
	}

	log.Println("Connected to Postgres!")

}
